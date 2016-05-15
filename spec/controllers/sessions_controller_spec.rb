require 'rails_helper'
require 'pp'

RSpec.describe SessionsController, type: :controller do
  before :all do
    @sales = User.create(email: 'john@veritrans.com', role: 'sales')
    @sales.set_password('ppl')

    @sales = User.create(email: 'rahnna@tokowinnetou.com', role: 'merchant')
    @sales.set_password('kampungutan')
  end

  describe 'new' do
    render_views

    it 'should show the login page if the user is not logged in' do
      get(:destroy)
      get(:new)

      expect(response.body).to match /Login/m
    end

    it 'should redirect sales if they are already logged in' do
      post(:create, session: {email: 'john@veritrans.com', password: 'ppl'})

      expect(response).to redirect_to '/sales/list_merchant'
    end

    it 'should redirect merchant if they are already logged in' do
      post(:create, session: {email: 'rahnna@tokowinnetou.com', password: 'kampungutan'})

      expect(response).to redirect_to '/merchant/form'
    end
  end


  describe 'create' do
    it 'should log the user in when they enter the correct email and password' do
      post(:create, session: {email: 'john@veritrans.com', password: 'ppl'})

      expect(session[:user_id]).not_to be_nil
    end

    it 'should redirect the user back to login page if they enter email that does not exist' do
      post(:create, session: {email: 'john@bogusmail.com', password: 'ppl'})

      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to '/login'
    end

    it 'should redirect the user back to login page if they enter
        correct email but incorrect password' do
      post(:create, session: {email: 'john@veritrans.com', password: 'boguspassword'})

      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to '/login'
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
