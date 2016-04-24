class SalesController < ApplicationController
  before_action :require_sales

  def list_merchant
    @sales = Sales.find(session[:user_id]) #entar ganti jadi => session[:user_id]
    @sales_merchants = @sales.merchants
  end
end
