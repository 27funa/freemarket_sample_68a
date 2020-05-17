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
    unless @profile.present?
      redirect_to new_profile_path
    end
  end

  def update
    @profile.update(profile_params)
    render :edit
  end

  private

  def profile_params
    params.require(:profile).permit(:introduction,:image).merge(user_id: current_user.id)
  end

  def set_profile
    @profile = Profile.find_by(user_id: current_user.id)
  end
end
