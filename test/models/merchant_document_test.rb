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

require 'test_helper'

class MerchantDocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
