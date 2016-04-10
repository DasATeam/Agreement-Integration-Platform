require 'rails_helper'

RSpec.describe MerchantOperational, type: :model do
  
  it 'store operational identity properly' do
  	#setup
  	merchant_operational = MerchantOperational.new

  	#exercise
  	merchant_operational.email = "john.doe@mail.com"
  	merchant_operational.telephone = "08123456789"
  	merchant_operational.emergency = "08123456789"

  	#verify
  	expect(merchant_operational.email).not_to be_nil 
  	expect(merchant_operational.telephone).not_to be_nil 
  	expect(merchant_operational.emergency).not_to be_nil 

  end
end
