class MerchantMailer < ApplicationMailer
 default from: 'notifications@example.com'
 
  def welcome_email(merchant, content)
    @merchant = merchant
    @content = content
    mail(to: @merchant.email, subject: 'Welcome to My Awesome Site')
  end
end
