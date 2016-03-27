class TermController < ApplicationController
  def index
    @term = Point.first

    render "index"
  end

  def agree
    @merchant = User.find(session[:user_id]).merchant
    @agreement = @merchant.agreements.first
    @agreement.has_agree = true
    @agreement.save

    redirect_to controller: "user", action: "merchant_new", hash: @merchant.registrationlink
  end
end

