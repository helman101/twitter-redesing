module ApplicationHelper
  def current_user?
    !session[:current_user].nil?
  end

  def set_user
    @user = User.find(session[:user_id])
  end
end
