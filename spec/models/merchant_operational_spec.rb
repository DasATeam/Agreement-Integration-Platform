require 'rails_helper'

RSpec.describe MerchantOperational, type: :model do
  it "should return true when information is complete" do
    merchant_operational = FactoryGirl.create(:merchant_operational)
    merchant_operational.check.should == true
  end
end
