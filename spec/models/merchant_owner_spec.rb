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

require 'rails_helper'

RSpec.describe MerchantOwner, type: :model do
  it "should return true when information is complete" do
    merchant_owner = FactoryGirl.create(:merchant_owner)
    merchant_owner.check.should == true
  end
end
