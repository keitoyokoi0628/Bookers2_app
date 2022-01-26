class UsersController < ApplicationController
    has_one_attached :image

  def show
   @user = User.find(params[:id])
   @user = current_user
  end

  def index
   @users =User.all
  end

  def edit
   @user = User.find(params[:id])
  end



  private
  def user_params
    params.require(:user).permit(:title, :body, :image)
  end
end
