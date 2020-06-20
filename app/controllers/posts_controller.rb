class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.all
  end

  def new

      @post = Post.new
      @images = @post.images.build

    
    @category_parent_array = ["---"]
#データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
         @category_parent_array << parent.name
      end
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

 # 子カテゴリーが選択された後に動くアクション
 def get_category_grandchildren
#選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
 end

  def create
    @post = Post.new(post_params)
    if @post.save
      params[:images]['image'].first(3).each do |img|
        @images = @post.images.create(image: img, post_id: @post.id)
      end
      redirect_to @post
    else
      # redirect_to new_post_path
      @images = @post.images.build
      @category_parent_array = ["---"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
     end

        


     render action: :new
    end  
  end

  def show
    @images = @post.images
  end

  def destroy
    @post.destroy
    redirect_to("/")
  end

  def edit
    # @images = @post.images.build
    # @images = @post.images.cache
    # 選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @img123 = @post.images
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
    end
  end
    
    # def get_category_children
    #   #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    #   @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
    # end
  
    # # 子カテゴリーが選択された後に動くアクション
    # def get_category_grandchildren
    # #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    #   @category_grandchildren = Category.find("#{params[:child_id]}").children
    # end

  def update
    # @images = @post.images.build
    if  @post.update(update_params)
        if  params[:images]
          params[:images]['image'].first(3).each do |img|
          @images = @post.images.create(image: img, post_id: @post.id)
          end
        else
          # params[:images]['image'].first(3).each do |img|
          # @images = @post.images.create(image: img, post_id: @post.id)
        
      end
    # binding.pry
      redirect_to post_path(@post), notice: ''
    else
    #   #updateを失敗すると編集ページへ
      @category_parent_array = ["---"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
    @img123 = @post.images
      render 'edit'
    end
  end


  private
  def post_params
    params.require(:post).permit(:item_name,:description,:sales_status,:brand,:size,:condition,:price,:shipping_area_id,:arrival_days,:postage_payment,:posts_status,:category_id,:image_taken).merge(user_id: current_user.id,category_id:params[:category_id])
  end

  def image_params
 
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def update_params
    params.require(:post).permit(
      :item_name,:description,:sales_status,:brand,:size,:condition,:price,:shipping_area_id,:arrival_days,:postage_payment,:posts_status,:category_id,:image_taken,images_attributes: [:image,:id,:_destroy])
  end
end

