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

FactoryGirl.define do
  factory :merchant_document do |f|
    f.path 'pictures/ktp.jpg'
  end
end
