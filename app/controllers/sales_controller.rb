class SalesController < ApplicationController
  before_action :require_sales

  def list_merchant
    @sales = current_user.sales
    @sales_merchants = @sales.merchants
  end
end
