module ApplicationHelper
  def user?
    !session[:current_user].nil?
  end

  def user_loged?
    redirect_to root_path, alert: 'You must be loged to have access' if session[:current_user].nil?
  end

  def current_user
    User.find(session[:user_id])
  end
end
