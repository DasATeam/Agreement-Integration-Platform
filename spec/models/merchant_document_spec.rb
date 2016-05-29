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

require 'rails_helper'

RSpec.describe MerchantDocument, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
