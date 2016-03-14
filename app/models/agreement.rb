class Agreement < ActiveRecord::Base
	belongs_to(:Merchant)
	has_one(:AgreementChannel)
end
