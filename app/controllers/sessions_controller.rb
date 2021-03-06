class SessionsController < ApplicationController
  def new
    @user = current_user
    redirect_to_dashboard if @user
  end

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

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

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
