require 'rails_helper'

RSpec.describe DocumentController, type: :controller do
  describe "GET index" do
    it "assigns @merchant_documents" do
      session[:user_id] = 1
      get :index
      expect(assigns(:merchant_documents)).to eq(Merchant.find(1).merchant_documents)
    end

    it "renders the index template" do
      session[:user_id] = 1
      get :index
      expect(response).to render_template("index")
    end
  end
end
