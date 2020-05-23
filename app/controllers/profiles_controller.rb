class ProfilesController < ApplicationController
  before_action :set_profile, except: :create

  def index
  end

  def new
    if @profile.present?
      redirect_to edit_profile_path(@profile)
    else
      @profile = Profile.new
    end
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to profiles_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if  @profile.update(profile_params)
      redirect_to profiles_path
    else
      render "edit"
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:introduction,:image).merge(user_id: current_user.id)
  end

  def set_profile
    @profile = Profile.find_by(user_id: current_user.id)
  end
end
