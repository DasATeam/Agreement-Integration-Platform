##
# This class is used to manage everything regarding session and user authentication

class SessionsController < ApplicationController

  ##
  # Show the login page
  #
  # User will be redirected to the appropriate page if they are already logged in


  # Handle Request : METHOD link
  #
  #   description
  #
  # == Returns:
  # METHOD::
  #   desc
  #   
  def new
    @user = current_user
    redirect_to_dashboard if @user
  end

  ##
  # Log the user in
  #
  # It will first search the database for the appropriate user,
  # and will match the stored email with user's input.
  #
  # They will be redirected if they successfully logged in,
  # and proper flash message will be shown if they are not .
  #
  # Handle Request : METHOD link
  #
  #   description
  #
  # == Returns:
  # METHOD::
  #   desc
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

  ##
  # Log the user out
  #
  # By removing `user_id` from the session, the app will recognized that the user
  # has logged out/not logged in.
  #
  # A safer way would be to destroy all session, but unwanted things
  # might happen if done so.

  # Handle Request : METHOD link
  #
  #   description
  #
  # == Returns:
  # METHOD::
  #   desc
  #   
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  ##
  # Redirect the user
  #
  # User will be redirected to the appropriate page depending on their role
  # and whether they are logged in or not.

  # Handle Request : METHOD link
  #
  #   description
  #
  # == Returns:
  # METHOD::
  #   desc
  #   
  def redirect_to_dashboard
    @user = current_user

    if @user.sales?
      redirect_to '/sales/list_merchant'
    elsif @user.merchant?
      redirect_to '/merchant/info/general'
    else
      # improper user role
      render status: :not_implemented
    end
  end
end
