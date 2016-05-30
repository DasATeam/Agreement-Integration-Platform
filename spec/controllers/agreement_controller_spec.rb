require 'rails_helper'
require 'pp'

RSpec.describe AgreementController, type: :controller do
  before :all do
    @user_sales = User.create(id: 69, email: 'john@veritrans.com', role: 'sales')
    @user_merchant = User.create(id: 70, email: 'chris@petani.com', role: 'merchant')

    @merchant = Merchant.new(id: 200, user_id: @user_merchant.id, sales_id: @user_sales.id)
    @merchant.save(validate: false)

    @agreement = Agreement.create(pks_number: 'dummy/pks/123', merchant_id: @merchant.id)
    @agreement_channels = AgreementChannel.create(id: 300, agreement_id: @agreement.id)
  end

  after :all do
    ActiveRecord::Base.subclasses.each(&:delete_all)
  end

  describe 'new' do
    it 'should return new agreement page' do
      session[':user_id'] = @user_sales.id
      get(:new)

      expect(response).to render_template('new')
    end
  end

  describe 'sales_success_create' do
    it 'should return information about new agreement if successfully made' do
      get :sales_success_create, { user_id: @user_merchant.id }

      expect(response).to render_template(:sales_success_create)
    end
  end

  describe 'change_price' do
    it 'should return the page to change channel pricing' do
      get :change_price, { haft: @agreement_channels.id, merchant_id: @merchant.id }

      expect(response).to render_template(:change_price)
    end
  end
end
