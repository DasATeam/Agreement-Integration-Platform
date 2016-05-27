class TermController < ApplicationController
  before_action :require_merchant

  def index
    # TODO: Should check first if merchant already fill the form
    @term = Point.first
    @merchant = current_user.merchant
    @agreement = @merchant.agreements.first
    @has_agreed = @agreement.has_agree
    render "index"
  end

  def agree
    @merchant = current_user.merchant
    @agreement.has_agree = true
    @agreement.save

    redirect_to controller: "user", action: "merchant_new", hash: @merchant.registration_link, success: "has agreed"
  end
end
