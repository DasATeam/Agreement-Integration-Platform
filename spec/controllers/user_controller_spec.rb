require 'rails_helper'
require 'digest/md5'

RSpec.describe UserController, type: :controller do

  context "User set password" do
    before :all do 
      @user = User.create(email: "test@email.com")
      @merchant = Merchant.create(name: "test", website: "test")
      @link = Digest::MD5.hexdigest(@user.email)
      @merchant.registration_link = @link
      @merchant.user = @user
    end

    it "Call set_password function" do 
      mock_pass = "123456"

      post(:merchant_set_password, link: @link, pass: {password: mock_pass, password_confirmation: mock_pass})
      expect(@user).to receive(:set_password).with(mock_pass)
    end 

    it "Give error when password too short" do 
      mock_pass = "12345"
      
      post(:merchant_set_password, link: @link, pass: {password: mock_pass, password_confirmation: mock_pass})
      expect(flash[:error]).not_to be_nil
    end 

    it "Give error when password different with its confirmation" do 
      mock_pass = "123456"
      diff_pass = "654321"

      post(:merchant_set_password, link: @link, pass: {password: mock_pass, password_confirmation: diff_pass})
      expect(flash[:error]).not_to be_nil
    end 

    it "renders the new template" do 
      get (:merchant_set_password, link: @link
      expect(response).to render_template("merchant_set_password") 
    end 

  end
end
