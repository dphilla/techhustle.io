class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_admin

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    current_user && current_user.admin? #needs both bc if current_user is nil needs to be checked, otherwise will error out
  end

  def check_current_user
    redirect_to login_path unless current_user
    flash[:notice] = "Please sign up or log in to see your networking info"
  end

  def sets_user_connection
    @connection = @user.connections.find(params[:id])
  end

end
