require 'rails_helper'
require 'pp'

RSpec.describe SalesController, type: :controller do
  describe "GET #list_merchant" do
    it "returns http success" do
      @user = User.find_by email: 'john@veritrans.com'
      request.session[:user_id] = @user.id
      get :list_merchant
      expect(response).to have_http_status(:success)

    end
  end

end
