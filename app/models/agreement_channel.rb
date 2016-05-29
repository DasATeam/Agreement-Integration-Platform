# == Schema Information
#
# Table name: agreement_channels
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  agreement_id    :integer
#  channel_type_id :integer
#  customprice     :string
#

class AgreementChannel < ActiveRecord::Base
	belongs_to(:agreement)
	belongs_to(:channel_type)
end
