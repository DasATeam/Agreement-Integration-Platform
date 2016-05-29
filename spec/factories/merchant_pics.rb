# == Schema Information
#
# Table name: merchant_pics
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
  factory :merchant_pic do |f|
    f.email 'chrispics@chris.com'
    f.name 'chrispics'
    f.address 'pamulang'
    f.telephone '8704384'
    # f.references(:merchant, foreign_key: true)
  end
end
