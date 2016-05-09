require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "create" do
    it "should log the user in when they enter the correct email and password" do
      fill_in 'email', :with => 'john@veritrans.com'
      fill_in 'password', :with => 'ppl'

      click_button 'Log in'

      expect(session[:user_id]).not_to be_nil
    end
  end
end
