require 'rails_helper'

RSpec.describe AgreementController, type: :controller do
  describe "GET new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    it "create new @user and @merchant" do
      name = "anyemail@AnyShop.com"
      email = "Any Name"
      website = "AnyShop.com"

      user = User.create(email: email)
      user.role = "merchant"
      user.id = user.id + 1

      merchant = Merchant.create(name: name, website: website)
      merchant.id = merchant.id + 1

      post :create, {form: { email: email, name: name, website: website }}
      expect(assigns(:user)).to eq(user)
      expect(assigns(:user).merchant).to eq(merchant)
      expect(assigns(:merchant)).to eq(merchant)
      expect(assigns(:merchant).user).to eq(user)
      
    end

    it "responds to html by default" do
      name = "anyemail@AnyShop.com"
      email = "Any Name"
      website = "AnyShop.com"

      post :create, {form: { email: email, name: name, website: website }}
      expect(response.content_type).to eq "text/html"
    end
  end
end
