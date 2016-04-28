require 'rails_helper'

RSpec.describe MerchantOwner, type: :model do
  it "should return true when information is complete" do
    merchant_owner = FactoryGirl.create(:merchant_owner)
    merchant_owner.check.should == true
  end
end
