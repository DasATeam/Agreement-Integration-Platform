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
