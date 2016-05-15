class MerchantController < ApplicationController

  def send_mail
    @text = params[:content]
    @id = params[:merchant_id]
    @merchant = Merchant.find(@id)

    MerchantMailer.welcome_email(@merchant, @text).deliver_now
  end
end
