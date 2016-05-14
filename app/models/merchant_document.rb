class MerchantDocument < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
	belongs_to(:merchant)
	belongs_to(:agreement)
	belongs_to(:document_type)
  has_one(:document_path)

  mount_uploader :file, FileUploader
  
end
