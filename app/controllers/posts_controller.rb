class PostsController < ApplicationController
  
  def index
    @parents = Category.where(ancestry: nil)
  end

  def new
    @post = Post.new
    @images = @post.images.build
  end

  def create
    @post = Post.new(post_params)

    if @post.save

      params[:images]['image'].each do |img|
        @images = @post.images.create(image: img, post_id: @post.id)
      end
      redirect_to @post
    else
      @images = @post.images.build
    render :new
    end  
  end

  def show
    @post =Post.find(params[:id])
    @images = @post.images

  end

  private
  def post_params
    params.require(:post).permit(:item_name,:description,:sales_status,:brand,:size,:condition,:price,:shipping_area,:arrival_days,:postage_payment,:posts_status,images_attributes: [:id,:image]).merge(user_id: current_user.id)
  end
end

