require 'rails_helper'

RSpec.describe AgreementController, type: :controller do
  before(:all) do
    @user_sales = User.find_by(email: 'john@veritrans.com')
    @user_merchant = User.find_by(email: 'chris@petani.com')
    @merchant = @user_merchant.merchant
    @agreement = @merchant.agreements.first
    @agreement_channels = @agreement.agreement_channels
  end


  describe "GET #sales_success_create" do
    it "returns http success" do
      get :sales_success_create, {user_id: @user_merchant.id}, {user_id: @user_sales.id}
      expect(response).to render_template(:sales_success_create)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #change_price" do 
    it "returns http success" do
      get :change_price, {haft: @agreement_channels.first.id, merchant_id: @merchant.id}, {user_id: @user_sales.id}
      expect(response).to render_template(:change_price)
      expect(response).to have_http_status(:success)
    end
  end



end
