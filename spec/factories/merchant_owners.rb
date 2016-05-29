# == Schema Information
#
# Table name: merchant_owners
#
#  id           :integer          not null, primary key
#  email        :string           not null
#  name         :string
#  address      :string
#  telephone    :string
#  merchant_id  :integer
#  is_completed :boolean
#

FactoryGirl.define do
  factory :merchant_owner do |f|
    f.email 'chrisowners@chris.com'
    f.name 'ccc'
    f.address 'jkt'
    f.telephone '021021021'
    # f.references(:merchant, foreign_key: true)
  end
end
