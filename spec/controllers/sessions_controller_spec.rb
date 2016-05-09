require 'rails_helper'
require 'pp'

RSpec.describe SessionsController, type: :controller do
  before :all do
    @user = User.create(email: 'john@veritrans.com', role: 'sales')
    @user.set_password('ppl')
  end

  describe 'new' do
    render_views

    it 'should show the login page if the user is not logged in' do
      get(:destroy)
      get(:new)

      expect(response.body).to match /Login/m
    end

    it 'should redirect merchant if they are already logged in' do
      post(:create, session: {email: 'john@veritrans.com', password: 'ppl'})

      expect(response).to redirect_to '/sales/list_merchant'
    end
  end


  describe 'create' do
    it 'should log the user in when they enter the correct email and password' do
      post(:create, session: {email: 'john@veritrans.com', password: 'ppl'})

      expect(session[:user_id]).not_to be_nil
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
