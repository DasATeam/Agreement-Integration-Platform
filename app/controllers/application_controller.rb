class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  add_flash_types :success
  helper_method :current_user

  # Helper Method : providing method to get current logged in user
  #
  #   Get current logged in user
  #
  # == Returns:
  # User::
  #   currently logged in user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Helper Method : providing method to check if user logged in
  #
  #   checking if user logged in
  #
  # == Returns:
  # Action::
  #   redirecting to login page if user has not been log in
  def require_user
    redirect_to 'login' unless current_user
  end

  # Helper Method : providing method to check if user role is sales
  #
  #   checking if user role is sales
  #
  # == Returns:
  # Action::
  #   redirecting to login page if user has not been log in or not a sales
  def require_sales
    redirect_to '/' unless current_user && @current_user.sales?
  end

  # Helper Method : providing method to check if user role is merchant
  #
  #   checking if user role is merchant
  #
  # == Returns:
  # Action::
  #   redirecting to login page if user has not been log in or not a merchant
  def require_merchant
    redirect_to '/' unless current_user && @current_user.merchant?
  end

  def check_rack_mini_profiler
    # for example - if current_user.admin?
    if current_user.sales?
      Rack::MiniProfiler.authorize_request
    end
  end
end
