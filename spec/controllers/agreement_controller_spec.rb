require 'rails_helper'

RSpec.describe AgreementController, type: :controller do

  describe "GET #sales_success_create" do
    it "returns http success" do
      get :sales_success_create, user_id: 1
      expect(response).to render_template(:sales_success_create)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #change_price" do 
    it "returns http success" do
      get :change_price, haft: 1
      expect(response).to render_template(:change_price)
      expect(response).to have_http_status(:success)
    end
  end



end
