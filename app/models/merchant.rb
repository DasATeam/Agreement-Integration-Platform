class Merchant < ActiveRecord::Base
	belongs_to(:user)
	
	has_many(:agreements)
	has_many(:merchant_documents)

	has_one(:merchant_customer_support)
	has_one(:merchant_operational)
	has_one(:merchant_owner)
	has_one(:merchant_pic)
end
