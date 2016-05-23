class SalesController < ApplicationController
  before_action :require_sales

  def list_merchant
    @sales = User.find_by(id: session[:user_id])
    @sales_merchants = Merchant.includes(:agreements).where(sales_id: @sales.id)
  end
end
