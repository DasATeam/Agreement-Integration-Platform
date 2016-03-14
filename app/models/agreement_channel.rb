class AgreementChannel < ActiveRecord::Base
	belongs_to(:agreement)
	belongs_to(:channeltype)
end
