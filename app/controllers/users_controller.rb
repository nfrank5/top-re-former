class UsersController < ApplicationController

  def index
    @all_users = User.all 
  end

  def new
    @user = User.new
  end

  def create
    #@user = User.new(username: params[:username], email: params[:email], password: params
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = "Your post has been created!"
      redirect_to edit_user_path
    else
      flash.now[:error] = "Fix your mistakes, please."
      render :edit, status: :unprocessable_entity
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end