# == Schema Information
#
# Table name: merchant_documents
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  merchant_id      :integer
#  agreement_id     :integer
#  document_type_id :integer
#  path             :string
#  file             :string
#

class MerchantDocument < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
	belongs_to(:merchant)
	belongs_to(:agreement)
	belongs_to(:document_type)
  has_one(:document_path)

  mount_uploader :file, FileUploader
  
end
