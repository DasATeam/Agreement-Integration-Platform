require 'rails_helper'

RSpec.describe MerchantPic, type: :model do
  
  it 'store Pic for each merchant identity properly' do
  	#setup
  	merchantpic = MerchantPic.new

  	#exercise
  	merchantpic.email = "john.doe@mail.com"
  	merchantpic.name = "John Doe"
  	merchantpic.address = "Jl. blabla"
  	merchantpic.telephone = "08123456789"


  	#verify
  	expect(merchantpic.email).not_to be_nil 
  	expect(merchantpic.name).not_to be_nil 
  	expect(merchantpic.address).not_to be_nil 
  	expect(merchantpic.telephone).not_to be_nil 

  end
end
