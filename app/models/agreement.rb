# == Schema Information
#
# Table name: agreements
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  pks_number     :string           not null
#  approver_name  :string
#  approver_role  :string
#  merchant_id    :integer
#  has_agree      :boolean
#  implementation :integer
#

class Agreement < ActiveRecord::Base
	belongs_to(:merchant)
	has_many(:agreement_channels)
	has_many(:merchant_documents)
end
