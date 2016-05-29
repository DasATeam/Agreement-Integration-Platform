# == Schema Information
#
# Table name: document_links
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  document_type_id :integer
#  link             :string
#

class DocumentLink < ActiveRecord::Base
  belongs_to(:document_type)
end
