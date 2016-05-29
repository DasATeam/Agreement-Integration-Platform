# == Schema Information
#
# Table name: merchant_customer_supports
#
#  id           :integer          not null, primary key
#  email        :string           not null
#  telephone    :string
#  emergency    :string
#  merchant_id  :integer
#  is_completed :boolean
#

FactoryGirl.define do
  factory :merchant_customer_support do |f|
    f.email 'chriscs@chris.com'
    f.telephone '0817268278'
    f.emergency '12345'
    # f.references(:merchant, foreign_key: true)
  end
end
