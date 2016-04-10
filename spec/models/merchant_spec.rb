require 'rails_helper'

RSpec.describe Merchant, type: :model do

  it 'store core identity properly' do
  	#setup
  	merchant = Merchant.new

  	#exercise
  	merchant.name = "John"
  	merchant.website = "johnstore.com"
  	merchant.email = "john.doe@mail.com"
  	merchant.city = "Jakarta"
  	merchant.address = "Jl. blabla no. 21, Indonesia"

  	#verify
  	expect(merchant.name).not_to be_nil 
  	expect(merchant.website).not_to be_nil 
  	expect(merchant.email).not_to be_nil 
  	expect(merchant.city).not_to be_nil 
  	expect(merchant.address).not_to be_nil 

  end

  it 'store office identity properly' do
  	#setup
  	merchant = Merchant.new

  	#exercise
  	merchant.office_status = 1
  	merchant.type_of_product = "Pakaian"
  	merchant.price_range = "100.000-500.000"
  	merchant.time_since_started = "01-01-2001"
  	merchant.ownership_type = 2
  	merchant.revenues_each_month = "500000"
  	merchant.credit_card_payment_ratio = "100.000-500.000"

  	#verify
  	expect(merchant.office_status).not_to be_nil 
  	expect(merchant.type_of_product).not_to be_nil 
  	expect(merchant.price_range).not_to be_nil 
  	expect(merchant.time_since_started).not_to be_nil 
  	expect(merchant.ownership_type).not_to be_nil 
  	expect(merchant.revenues_each_month).not_to be_nil 
  	expect(merchant.credit_card_payment_ratio).not_to be_nil 

  end

   
end
