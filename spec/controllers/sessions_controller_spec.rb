require 'rails_helper'
require 'pp'

RSpec.describe SessionsController, type: :controller do
  describe 'create' do
    before :all do
      @user = User.create(email: 'john@veritrans.com', role: 'sales')
      @user.set_password('ppl')
      pp @user
    end

    it 'should log the user in when they enter the correct email and password' do
      post(:create, session: {email: 'john@veritrans.com', password: 'ppl'})

      # expect(session[:user_id]).not_to be_nil
      pp flash[:notice]
    end

    # it 'should log the user out after they are logged in' do
    #   post(:create, session: {email: 'john@veritrans.com', password: 'ppl'})

    #   expect(session[:user_id]).not_to be_nil

    #   post(:delete)

    #   expect(session[:user_id]).should be_nil
    # end
  end
end
