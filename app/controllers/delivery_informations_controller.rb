class DeliveryInformationsController < ApplicationController

  before_action :set_delivery_information, except: :create

  def new
    if @delivery_information.present?
      redirect_to edit_delivery_information_path(@delivery_information)
    else
      @delivery_information = DeliveryInformation.new
    end
  end

  def create
    @delivery_information = DeliveryInformation.new(delivery_information_params)
    if @delivery_information.save
      redirect_to profiles_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @delivery_information.update(delivery_information_params)
      redirect_to profiles_path
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


end
