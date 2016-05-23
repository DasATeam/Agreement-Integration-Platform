require 'rails_helper'
require 'digest/md5'

RSpec.describe UserController, type: :controller do

  context "User set password" do
    before :all do 
      test_user = User.find_by email: "test@email.com"
      test_merchant = Merchant.find_by name: "test", website: "test"
      test_merchant.destroy if test_merchant 
      test_user.destroy if test_user 

      @user = User.create(email: "test@email.com")
      @merchant = Merchant.new(name: "test", website: "test")
      @link = Digest::MD5.hexdigest(@user.email)
      @merchant.save validate: false
      @merchant.registration_link = @link
      @merchant = Merchant.find_by name: "test", website: "test"
      @merchant.user = @user
      @merchant.save validate: false
    end

    it "Call set_password function" do 
      mock_pass = "123456"
      user = User.find_by email: "test@email.com"
      post :merchant_set_password, {hash: @link}, pass: {password: mock_pass, password_confirmation: mock_pass}
      expect(response).to render_template("merchant_set_password")
    end 

    it "Give error when password too short" do 
      mock_pass = "12345"
      post(:merchant_set_password, {hash: @link}, pass: {password: mock_pass, password_confirmation: mock_pass})
      expect(response).to render_template("merchant_set_password")
    end 

    it "Give error when password different with its confirmation" do 
      mock_pass = "12345"
      diff_pass = "654321"
      post(:merchant_set_password, {hash: @link}, pass: {password: mock_pass, password_confirmation: diff_pass})
      expect(response).to render_template("merchant_set_password")
    end 

    it "renders the new template" do 
      get :merchant_set_password, {hash: @link}
      expect(response).to render_template("merchant_set_password") 
    end 

  end
end
