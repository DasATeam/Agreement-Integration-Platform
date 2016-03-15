class Agreement < ActiveRecord::Base
	belongs_to(:merchant)
	has_one(:agreementchannel)
end
