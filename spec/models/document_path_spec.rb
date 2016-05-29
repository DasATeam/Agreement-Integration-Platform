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

require 'rails_helper'

RSpec.describe DocumentPath, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
