# == Schema Information
#
# Table name: document_paths
#
#  id                   :integer          not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  merchant_document_id :integer
#  path                 :string
#

class DocumentPath < ActiveRecord::Base
  belongs_to(:merchant_documents)
end
