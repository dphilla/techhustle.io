class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_admin

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    current_user && current_user.admin? #needs both bc if current_user is nil needs to be checked, otherwise will error out
  end

end
