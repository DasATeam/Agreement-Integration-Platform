class SalesController < ApplicationController
  before_action :require_sales

  # Handle Request : METHOD link
  #
  #   description
  #
  # == Returns:
  # METHOD::
  #   desc
  #   
  def list_merchant
    @sales = current_user.sales
    @sales_merchants = @sales.merchants
  end

  # Handle Request : METHOD link
  #
  #   description
  #
  # == Returns:
  # METHOD::
  #   desc
  #   
  private def var
    @merchant = current_user.merchant
    @bank_account = @merchant.bank_account ? @merchant.bank_account : BankAccount.new(merchant: @merchant)
    @merchant_operational = @merchant.merchant_operational ? @merchant.merchant_operational : MerchantOperational.new(merchant: @merchant)
    @merchant_cs = @merchant.merchant_customer_support ? @merchant.merchant_customer_support : MerchantCustomerSupport.new(merchant: @merchant)
    @merchant_owner = @merchant.merchant_owner ? @merchant.merchant_owner : MerchantOwner.new(merchant: @merchant)
    @merchant_pic = @merchant.merchant_pic ? @merchant.merchant_pic : MerchantPic.new(merchant: @merchant)
  end
end
