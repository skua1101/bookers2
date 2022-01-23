class UsersController < ApplicationController
  def index
    @users = User.all
    @books = Book.all
    @book = Book.new
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(params[ :id])
    @book =Book.new
    @books = Book.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
        render "edit"
    else
        redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.id = current_user.id
    if @user.update(user_params)
        redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
        render "edit"
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  
end
