class Agreement < ActiveRecord::Base
	belongs_to(:merchant)
	has_many(:agreement_channels)
	has_many(:merchant_documents)
end
