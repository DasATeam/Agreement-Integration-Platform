# == Schema Information
#
# Table name: merchant_operationals
#
#  id           :integer          not null, primary key
#  email        :string           not null
#  telephone    :string
#  emergency    :string
#  merchant_id  :integer
#  is_completed :boolean
#

FactoryGirl.define do
  factory :merchant_operational do |f|
    f.email 'chrisowners@chris.com'
    f.telephone '021021021'
    f.emergency '12345'
    # f.references(:merchant, foreign_key: true)
  end
end
