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

require 'rails_helper'
require 'spec_helper'

RSpec.describe Merchant, type: :model do
  it 'should return true when document is complete' do
    merchant_documents = FactoryGirl.create(:merchant_document)
    merchant = FactoryGirl.create(:merchant)
    merchant.document_check.should == true
  end
#  it 'should return true when information is complete' do
#    merchant_pics = FactoryGirl.create(:merchant_pic)
#    merchant_operationals = FactoryGirl.create(:merchant_operational)
#    merchant_owners = FactoryGirl.create(:merchant_owner)
#    merchant_customer_supports = FactoryGirl.create(:merchant_customer_support)
#    merchant = FactoryGirl.create(:merchant)
#    merchant.information_check.should == true
#  end
end
