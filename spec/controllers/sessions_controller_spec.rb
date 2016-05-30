require 'rails_helper'
require 'pp'

RSpec.describe SessionsController, type: :controller do
  before :all do
    @sales = User.create(email: 'johnsession@veritrans.com', role: 'sales')
    @sales.set_password('ppl')

    @merchant = User.create(email: 'rahnna@tokowinnetou.com', role: 'merchant')
    @merchant.set_password('kampungutan')
  end

  after :all do
    ActiveRecord::Base.subclasses.each(&:delete_all)
  end

  describe 'new' do
    it 'should show the login page if the user is not logged in' do
      get(:destroy)
      get(:new)

      expect(response).to render_template('new')
    end

    it 'should redirect sales if they already logged in' do
      post(:create, session: { email: 'johnsession@veritrans.com', password: 'ppl' })

      expect(response).to redirect_to '/sales/list_merchant'
    end

    it 'should redirect merchant if they are already logged in' do
      post(:create, session: {email: 'rahnna@tokowinnetou.com', password: 'kampungutan'})

      expect(response).to redirect_to '/merchant/info/general'
    end
  end


  describe 'create' do
    it 'should redirect the user back to login page if they enter email that does not exist' do
      get(:destroy)
      post(:create, session: {email: 'johnsession@bogusmail.com', password: 'ppl'})

      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to '/login'
    end

    it 'should redirect the user back to login page if they enter
        correct email but incorrect password' do
      get(:destroy)
      post(:create, session: {email: 'johnsession@veritrans.com', password: 'boguspassword'})

      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to '/login'
    end

    it 'should redirect sales if they enter the correct email and password' do
      get(:destroy)
      post(:create, session: {email: 'johnsession@veritrans.com', password: 'ppl'})

      expect(session[:user_id]).not_to be_nil
      expect(response).to redirect_to '/sales/list_merchant'
    end

    it 'should redirect merchant if they enter the correct email and password' do
      get(:destroy)
      post(:create, session: {email: 'rahnna@tokowinnetou.com', password: 'kampungutan'})

      expect(session[:user_id]).not_to be_nil
      expect(response).to redirect_to '/merchant/info/general'
    end
  end

  describe 'destroy' do
    it 'should log the user out after they are logged in' do
      post(:create, session: {email: 'johnsession@veritrans.com', password: 'ppl'})
      expect(session[:user_id]).not_to be_nil

      get(:destroy)
      expect(session[:user_id]).to be_nil
    end
  end
end
