class MerchantMailer < ApplicationMailer
 # default from: 'theateam.@example.com'
 
  def welcome_email(merchant, content)
    @merchant = merchant
    @user = merchant.user
    @content = content
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
