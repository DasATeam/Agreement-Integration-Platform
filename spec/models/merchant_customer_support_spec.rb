require 'rails_helper'

RSpec.describe MerchantCustomerSupport, type: :model do
  
   it 'store customer support identity properly' do
  	#setup
  	merchant_cs = MerchantCustomerSupport.new

  	#exercise
  	merchant_cs.email = "john.doe@mail.com"
  	merchant_cs.telephone = "08123456789"
  	merchant_cs.emergency = "08123456789"

  	#verify
  	expect(merchant_cs.email).not_to be_nil 
  	expect(merchant_cs.telephone).not_to be_nil 
  	expect(merchant_cs.emergency).not_to be_nil 

  end

end
