require 'rails_helper'

RSpec.describe MerchantPic, type: :model do
  it "should return true when information is complete" do
    merchant_pic = FactoryGirl.create(:merchant_pic)
    merchant_pic.check.should == true
  end
end
