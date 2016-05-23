require 'rails_helper'
require 'pp'

RSpec.describe SessionsController, type: :controller do
  before :all do
    @user = User.find_by email: 'john@veritrans.com'
  end

  describe 'new' do
    it 'should show the login page if the user is not logged in' do
      get(:destroy)
      get(:new)

      expect(response).to render_template("new")
    end

    it 'should redirect sales if they already logged in' do
      session[:user_id] = @user
      get(:new)

      expect(response).to redirect_to '/sales/list_merchant'
    end    
  end


  describe 'create' do
    it 'should log the user in when they enter the correct email and password' do
      post(:create, session: {email: 'john@veritrans.com', password: 'ppl'})

      expect(session[:user_id]).not_to be_nil
    end

    it 'should redirect sales if they enter the correct email and password' do
      post(:create, session: {email: 'john@veritrans.com', password: 'ppl'})

      expect(response).to redirect_to '/sales/list_merchant'
    end
  end

  describe 'destroy' do
    it 'should log the user out after they are logged in' do
      post(:create, session: {email: 'john@veritrans.com', password: 'ppl'})
      expect(session[:user_id]).not_to be_nil

      get(:destroy)
      expect(session[:user_id]).to be_nil
    end
  end
end
