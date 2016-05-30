# == Schema Information
#
# Table name: merchants
#
#  id                        :integer          not null, primary key
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  name                      :string
#  website                   :string
#  email                     :string
#  city                      :string
#  address                   :string
#  office_status             :integer
#  type_of_product           :string
#  price_range               :string
#  time_since_started        :date
#  ownership_type            :integer
#  revenues_each_month       :decimal(, )
#  credit_card_payment_ratio :decimal(, )
#  registration_link         :string
#  sales_id                  :integer
#  user_id                   :integer
#  info_is_completed         :boolean
#  documents_is_completed    :boolean
#

FactoryGirl.define do
  factory :merchant do |f|
    f.name 'Chris'
    f.website 'www.chris.com'
    f.email 'chris@chris.com'
    f.city 'Pamulang'
    f.address 'Pamulang Permai'
    f.office_status '1'
    f.type_of_product 'Buah-buahan'
    f.price_range '5000-150000'
    f.time_since_started '2009-01-09'
    f.ownership_type '3'
    f.revenues_each_month '500000'
    f.credit_card_payment_ratio '0.5'
    f.registration_link 'jfjfjf.fkfkf.vom'
  end
end
