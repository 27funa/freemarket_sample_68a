class DeliveryInformationsController < ApplicationController

  before_action :set_delivery_information, except: :create
  before_action :set_item, only: [:new, :create, :edit, :update]

  def new
    if @delivery_information.present?
      redirect_to edit_delivery_information_path(@delivery_information)
    else
      @delivery_information = DeliveryInformation.new
    end
  end

  def create
    @delivery_information = DeliveryInformation.new(delivery_information_params)
    if @post.present?
      if @delivery_information.save
        redirect_to post_buys_path(@post)
      else
        render "new"
      end
    else
      if @delivery_information.save
        redirect_to profiles_path
      else
        render "new"
      end
    end
  end

  def edit
    if @post.present?
      
    else
      
    end
  end

  def update
 
    if @delivery_information.update(delivery_information_params)
      if @post.present?
        redirect_to post_buys_path(@post)
      else
        redirect_to profiles_path
      end
    else
      render "edit"
    end
  end

  private

  def delivery_information_params
    params.require(:delivery_information).permit(:family_name,:first_name,:family_name_kana,:first_name_kana,:postal_code,:state_id,:city,:address_line_1,:address_line_2,:tel).merge(user_id: current_user.id)
  end

  def set_delivery_information
    @delivery_information = DeliveryInformation.find_by(user_id: current_user.id)
  end

  def set_item
    if params[:post_id]
    @post = Post.find(params[:post_id]) 
    end
  end

end
