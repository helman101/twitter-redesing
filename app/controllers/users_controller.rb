class UsersController < ApplicationController
  before_action :set_user

  def index; end

  def show; end

  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :photo, :coverImage, :fullName)
  end

  def set_user
    @user = User.find(session[:user_id])
  end
end
