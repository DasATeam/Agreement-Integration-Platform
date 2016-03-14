class ChannelType < ActiveRecord::Base
	has_one(:AgreementChannel)
end
