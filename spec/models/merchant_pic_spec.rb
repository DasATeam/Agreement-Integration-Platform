# == Schema Information
#
# Table name: merchant_pics
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

RSpec.describe MerchantPic, type: :model do
  it "should return true when information is complete" do
    merchant_pic = FactoryGirl.create(:merchant_pic)
    merchant_pic.check.should == true
  end
end
