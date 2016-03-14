class Merchant < ActiveRecord::Base
	belongs_to(:user)
	has_one(:MerchantCustomerSupport)
	has_one(:MerchantOperational)
	has_one(:MerchantOwner)
	has_one(:MerchantPic)
end
