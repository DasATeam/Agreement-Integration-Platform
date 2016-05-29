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

require 'rails_helper'

RSpec.describe MerchantOperational, type: :model do
  it "should return true when information is complete" do
    merchant_operational = FactoryGirl.create(:merchant_operational)
    merchant_operational.check.should == true
  end
end
