class MerchantDocument < ActiveRecord::Base
	belongs_to(:merchant)
	belongs_to(:agreement)
	belongs_to(:document_type)
end
