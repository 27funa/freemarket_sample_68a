class CategoriesController < ApplicationController
  before_action :set_category, only: [:parent, :child, :grandchild]

  def index
    @parents = Category.where(ancestry: nil)
  end
 
  def new
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end




  def parent
    @parent = Category.find(params[:id]).children
    grandchildren_id = @category.descendant_ids
    find_category_item(grandchildren_id)
  end

  def child
    @parent = Category.find(params[:id]).children
    grandchildren_id = @category.child_ids
    find_category_item(grandchildren_id)
  end

  def grandchild
    @posts = []
    category_item = Post.includes(:images).where(category_id: params[:id])
    category_present(category_item)
  end


  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_present(category_item)
    if category_item.present?
      @posts += category_item
    end
  end

  def find_category_item(grandchildren_id)
    @posts = []
    category_item = []
    grandchildren_id.each do |grandchild_id|
      category_item = Post.includes(:images).where(category_id: grandchild_id)
      category_present(category_item)
    end
  end

end
