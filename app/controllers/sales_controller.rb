class SalesController < ApplicationController
  before_action :require_sales

  def list_merchant
    @sales = User.find(session[:user_id]).sales #entar ganti jadi => session[:user_id]
    @sales_merchants = @sales.merchants
  end
end
