class Merchant < ActiveRecord::Base
	belongs_to(:user)
	has_many(:agreements)
	has_one(:merchant_customer_support)
	has_one(:merchant_operational)
	has_one(:merchant_owner)
	has_one(:merchant_pic)
	has_one(:bank_account)
end
