module ApplicationHelper
  def user?
    !session[:current_user].nil?
  end

  def user_loged?
    if session[:current_user].nil?
      redirect_to root_path, alert: 'You must be loged to have access'
    end
  end

  def current_user
    User.find(session[:user_id])
  end

  def set_user
    @user ||= User.find(session[:user_id])
  end
end
