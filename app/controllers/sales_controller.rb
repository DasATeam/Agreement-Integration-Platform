class SalesController < ApplicationController
  before_action :require_sales

  # Handle Request : GET sales/list_merchant
  #
  #   Used to display the list of merchants handled by a specific sales
  #
  # == Returns:
  # GET::
  #   The list of merchants handled by a specific sales
  #   
  def list_merchant
    @sales = User.find_by(id: session[:user_id])
    @sales_merchants = Merchant.includes(:agreements).where(sales_id: @sales.id)
  end

  private def var
    @merchant = current_user.merchant
    @bank_account = @merchant.bank_account ? @merchant.bank_account : BankAccount.new(merchant: @merchant)
    @merchant_operational = @merchant.merchant_operational ? @merchant.merchant_operational : MerchantOperational.new(merchant: @merchant)
    @merchant_cs = @merchant.merchant_customer_support ? @merchant.merchant_customer_support : MerchantCustomerSupport.new(merchant: @merchant)
    @merchant_owner = @merchant.merchant_owner ? @merchant.merchant_owner : MerchantOwner.new(merchant: @merchant)
    @merchant_pic = @merchant.merchant_pic ? @merchant.merchant_pic : MerchantPic.new(merchant: @merchant)
  end
end
