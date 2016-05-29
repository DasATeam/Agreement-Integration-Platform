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

require 'rails_helper'

RSpec.describe MerchantCustomerSupport, type: :model do
  it "should return true when information is complete" do
    merchant_customer_support = FactoryGirl.create(:merchant_customer_support)
    merchant_customer_support.check.should == true
  end
end
