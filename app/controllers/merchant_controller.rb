class MerchantController < ApplicationController

  def send_mail
    @text = params[:content]
    @id = params[:merchant_id]
    @merchant = Merchant.find(@id)


    begin
      if MerchantMailer.welcome_email(@merchant, @text).deliver_now
        flash[:notice] = "Mail successfully sent to" + @merchant.name
        redirect_to sales_list_merchant_url
      else
        flash[:alert] = "Mail failed to send, check your connection and try again"
        redirect_to controller: "agreement", action:"sales_success_create", user_id: @merchant.user.id
      end
    rescue Exception
      flash[:alert] = "Mail failed to send, check your connection and try again"
      redirect_to controller: "agreement", action:"sales_success_create", user_id: @merchant.user.id
    end
  end
end