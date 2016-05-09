require 'rails_helper'
require 'pp'

RSpec.describe SessionsController, type: :controller do
  describe 'create' do
    before :all do
      @user = User.create(email: 'john@veritrans.com', role: 'sales')
      @user.set_password('ppl')
    end

    it 'should log the user in when they enter the correct email and password' do
      post(:create, session: {email: 'john@veritrans.com', password: 'ppl'})

      expect(session[:user_id]).not_to be_nil
    end

    it 'should log the user out after they are logged in' do
      post(:create, session: {email: 'john@veritrans.com', password: 'ppl'})
      expect(session[:user_id]).not_to be_nil

      get(:destroy)
      expect(session[:user_id]).to be_nil
    end
  end
end
