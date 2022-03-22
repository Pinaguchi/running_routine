class UsersController < ApplicationController
  #before_action :authenticate_user!

  def index
    @user = current_user
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    #@records = @user.records
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to record_my_page_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
