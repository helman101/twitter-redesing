class UsersController < ApplicationController
  before_action :user_loged?, only: [ :show, :edit, :destroy ]
  before_action :set_user, if: :user?, only: %i[destroy edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(user_params[:user_id])
    @opinions = User.friends_and_own_opinions
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'You\'ve succesfully create a user, please log in'
    else
      redirect_to new_user_path, notice: 'invalid inputs, try again'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: 'The changes were succesfully apply'
    else
      redirect_to edit_user_path, alert: 'Invalid changes, please try again'
    end
  end

  def destroy
    @user.destroy

    redirect_to root_path, alert: 'User was destroy succesfully'
  end

  private

  def user_params
    params.require(:user).permit(:userName, :email, :password, :password_confirmation, :photo, :coverImage, :fullName)
  end

  def set_user
    @user = User.find(session[:user_id])
  end
end
