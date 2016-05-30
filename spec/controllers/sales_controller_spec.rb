require 'rails_helper'
require 'pp'

RSpec.describe SalesController, type: :controller do
  before :all do
    @sales = User.create(id: 2000, email: 'johnsales@veritrans.com', role: 'sales')
    @merchant = User.create(id: 2001, email: 'zaki@padang.com', role: 'merchant')
  end

  after :all do
    ActiveRecord::Base.subclasses.each(&:delete_all)
  end

  describe 'list_merchant' do
    it 'should return a page with a list of merchants' do
      session[:user_id] = @sales.id
      get :list_merchant

      expect(response).to render_template('list_merchant')
    end
  end
end
