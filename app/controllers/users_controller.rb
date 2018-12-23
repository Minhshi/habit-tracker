class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    authorize @user
    if @user.save
      redirect_to @user
    else
      redirect_to @user
    end

  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end
end
