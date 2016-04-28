# Load the Rails application.
require File.expand_path('../application', __FILE__)
# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.gmail.com',
    :domain         => 'gmail.com',
    :port           => 587,
    :user_name      => 'theateam.veritrans@gmail.com',
    :password       => 'kakdellaidolaku',
    :authentication => :plain,
    :enable_starttls_auto => true,
    :openssl_verify_mode  => 'none'
}


