class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def show
    # @user = User.find(params[:id])
    # @user = current_user
    authorize @user
  end

  def edit
    # @user = User.find(params[:id])
    # @user = current_user
    authorize @user
  end

  def update
    # @user = User.find(params[:id])
    # @user = current_user
    @user.update(user_params)
    authorize @user
    if @user.save
      redirect_to profile_path
    else
      redirect_to profile_path
    end

  end

  private

  def find_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:photo)
  end
end
