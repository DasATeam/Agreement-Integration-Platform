##
# This class is used to manage everything regarding session and user authentication

class SessionsController < ApplicationController

  # Handle Request : GET login
  #
  #   Show the login page.
  #
  # == Returns:
  # GET::
  #   Login form, or redirect to dashboard if already logged in
  #
  def new
    @user = current_user
    redirect_to_dashboard if @user
  end


  # Handle Request : POST create
  #
  #   Log the user in. It will first search the database for the appropriate
  #   user, and will match the stored email with user's input
  #
  # == Returns:
  # POST::
  #   Redirect to dashboard if successfully logged in, or back to login with
  #   proper flash message if are not
  #
  def create
    @user = User.find_by_email(params[:session][:email])

    if @user
      if @user.password_match?(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to_dashboard
      else
        flash[:notice] = 'Wrong password'
        redirect_to '/login'
      end
    else
      flash[:notice] = 'Email does not exist'
      redirect_to '/login'
    end
  end


  # Handle Request : GET logout
  #
  #   Log the user out. By removing `user_id` from the session, the app
  #   will recognize whether the user has logged out/not logged in
  #
  # == Returns:
  # GET::
  #   Redirect to root
  #
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end


  # Helper method that will be redirect the user to the appropriate page
  # depending on their role and whether they are logged in or not
  #
  # == Returns:
  # METHOD::
  #   Redirect to list of merchant for sales, or redirect to merchant general info for merchant
  #
  def redirect_to_dashboard
    @user = current_user

    if @user.sales?
      redirect_to '/sales/list_merchant'
    elsif @user.merchant?
      redirect_to '/merchant/info/general'
    end
  end
end
