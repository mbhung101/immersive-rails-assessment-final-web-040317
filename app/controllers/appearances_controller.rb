class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path
    end
  end

  def edit
    @appearance = Appearance.find(params[:id])
  end

  def update
    # @user = User.find(appearance_params[:user_id])
    # unfinished producer editing
    @appearance = Appearance.update(rating: appearance_params[:rating])
    # only thing you can change is rating and the form/validation prevents unwanted values so no
    # checks are needed
    redirect_to episodes_path
  end

  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating, :user_id)
  end

end
