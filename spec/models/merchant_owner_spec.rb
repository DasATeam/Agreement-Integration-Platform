require 'rails_helper'

RSpec.describe MerchantOwner, type: :model do
  it 'store owner for each merchant identity properly' do
  	#setup
  	merchant_owner = MerchantOwner.new

  	#exercise
  	merchant_owner.email = "john.doe@mail.com"
  	merchant_owner.name = "John Doe"
  	merchant_owner.address = "Jl. blabla"
  	merchant_owner.telephone = "08123456789"


  	#verify
  	expect(merchant_owner.email).not_to be_nil 
  	expect(merchant_owner.name).not_to be_nil 
  	expect(merchant_owner.address).not_to be_nil 
  	expect(merchant_owner.telephone).not_to be_nil 

  end
end
