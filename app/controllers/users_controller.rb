class UsersController < ApplicationController

 before_action :correct_user, only: [:edit, :update]

  def show
   @user = User.find(params[:id])
   @books = @user.books
   @book = Book.new
  end


  def index
   @users =User.all
   @user = User.new
   @user = current_user
   @book = Book.new
  end

  def create
   @user = User.new(user_params)
   if @user.save
      redirect_to user_path(current_user.id)
   else
    @user = User.all
    render :index
   end
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
   else
    flash[:notice]= 'error'
    render :edit
   end

  end



  private
  def user_params
    params.require(:user).permit(:name, :body, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless @user == current_user
  end

end
