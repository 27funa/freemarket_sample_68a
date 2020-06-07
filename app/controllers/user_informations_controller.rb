class UserInformationsController < ApplicationController

  before_action :set_user_information, except: :create

  def new
    if @user_information.present?
      redirect_to edit_user_information_path(@user_information)
    else
      @user_information = UserInformation.new
    end
  end

  def create
    @user_information = UserInformation.new(user_information_params)
    if @user_information.save
      redirect_to profiles_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @user_information.update(user_information_params)
      redirect_to profiles_path
    else
      render "edit"
    end
  end

  private

  def user_information_params
    params.require(:user_information).permit(:family_name,:first_name,:family_name_kana,:first_name_kana,:birth,:postal_code,:state,:city,:address_line_1,:address_line_2).merge(user_id: current_user.id)
  end

  def set_user_information
    @user_information = UserInformation.find_by(user_id: current_user.id)
  end
end
