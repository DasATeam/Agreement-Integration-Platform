require 'rails_helper'
require 'digest/md5'
require 'pp'

RSpec.describe UserController, type: :controller do
  before :all do
    @user = User.create(id: 8, email: 'test@email.com', role: 'sales')
    @merchant = Merchant.create(name: 'test', website: 'test')
    @link = Digest::MD5.hexdigest(@user.email)
    @merchant.registration_link = @link
    @merchant.user = @user
    @merchant.save
  end

  render_views

  it 'should render the set password page if the merchant had never set the password' do
    get :merchant_set_password, { hash: @link }
    expect(response).to render_template('merchant_set_password')
  end

  it 'should prevent the user to enter password that is too short' do
    mock_pass = '123456'

    post(:merchant_set_password, hash: @link, pass: {password: mock_pass, password_confirmation: mock_pass})
    expect(flash[:error]).not_to be_nil
  end

  it 'should prevent the user when password is different with its confirmation' do
    mock_pass = '12345678'
    diff_pass = '87654321'

    post(:merchant_set_password, hash: @link, pass: {password: mock_pass, password_confirmation: diff_pass})
    expect(flash[:error]).not_to be_nil
  end

  it 'should save the merchant password if the password is valid' do
    mock_pass = '12345678'

    post(:merchant_set_password, hash: @link, pass: {password: mock_pass, password_confirmation: mock_pass})

    @user.set_password '12345678'

    expect(flash[:error]).to be_nil
    expect @user.password_match? '12345678'
  end
end
