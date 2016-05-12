class TermController < ApplicationController
  def index
    # TODO: Should check first if merchant already fill the form
    @term = Point.first

    render "index"
  end

  def doc
    @user = current_user
    @merchant = @user.merchant
    @agreement = @merchant.first
    @term = Point.first


    respond_to do |format|
      format.html do
        render :pdf => "Agreement",
        :disposition => "attachment",
        :template => "term/doc.html.erb"
      end
    end
  end

  def agree
    @merchant = User.find(session[:user_id]).merchant
    @agreement = @merchant.agreements.first
    @agreement.has_agree = true
    @agreement.save

    redirect_to controller: "user", action: "merchant_new", hash: @merchant.registration_link, success: "has agreed"
  end
end
