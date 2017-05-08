class UsersController < ApplicationController
  def index
    @user= User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.save
    redirect_to users_path
  end

  def edit
    @user = User.find_by id: params[:id]
  end
  def update
      @user = User.find_by id: params[:id]
      @user.update_attributes user_params
  end
  def destroy
    @user = User.find_by id: params[:id]
    @user.destroy
  end
  def show
    @user = User.find_by id: params[:id]
  end
  def user_params
    params.require(:user).permit :first_name, :last_name, :description
  end
end
