class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :success
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to 'login' unless current_user
  end

  def require_sales
    redirect_to '/' unless current_user.sales?
  end

  def require_merchant
    redirect_to '/' unless current_user.merchant?
  end
end
