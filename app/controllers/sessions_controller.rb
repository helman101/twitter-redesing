class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: session_params[:email])

    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path, notice: 'Log in successfully'
    else
      redirect_to root_path
    end
  end

  def destroy
    session.destroy[:user_id]

    redirect_to root_path
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
