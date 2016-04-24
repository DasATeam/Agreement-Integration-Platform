require 'rails_helper'

RSpec.describe SalesController, type: :controller do

  describe "GET #list_merchant" do
    it "returns http success" do
      get :list_merchant
      expect(response).to have_http_status(:success)
    end
  end

end
