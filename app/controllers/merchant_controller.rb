class MerchantController < ApplicationController

  def send_mail
    @text = params[:content]
    @merchant = Merchant.find()

    MerchantMailer.welcome_email(@user, @text).deliver_now
  end
end
