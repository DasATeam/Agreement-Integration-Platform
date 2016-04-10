require 'rails_helper'

RSpec.describe Agreement, type: :model do
  it "store properly" do
    agreement = Agreement.create(pks_number: "4/PKS-M/VT/III/2016")
    merchant = Merchant.find(1)

    #exercise 
    agreement.merchant_id = 1 

    #verify 
    expect(agreement.id).not_to be_nil  
    expect(agreement.pks_number).not_to be_nil  
    expect(agreement.merchant).to eq(merchant)

  end
end
