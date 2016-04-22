class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])

    if @user && @user.password_match?(params[:session][:password])
      session[:user_id] = @user.id

      if @user.sales?
        redirect_to '/sales/list_merchant'
      elsif @user.merchant?
        redirect_to '/merchant/form'
      else
        # improper user role
        render status: :not_implemented
      end
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
