class MerchantformController < ApplicationController
	before_action :require_merchant

	def edit
	end

	def update
	  check = true
	  @user = current_user

	  @merchant = @user.merchant
	  @merchant.update(merchant_params)
	  check = @merchant.save(validate: false) and check

	  @merchant_cs = MerchantCustomerSupport.new(merchant_customer_support_params)
	  @merchant_cs.merchant = @merchant
	  check = @merchant_cs.check and check

	  @merchant_op = MerchantOperational.new(merchant_operational_params)
	  @merchant_op.merchant = @merchant
	  check = @merchant_op.check and check

	  @merchant_pic = MerchantPic.new(merchant_pic_params)
	  @merchant_pic.merchant = @merchant
	  check = @merchant_pic.check and check

	  @merchant_owner = MerchantOwner.new(merchant_owner_params)
	  @merchant_owner.merchant = @merchant
	  check = @merchant_owner.check and check

	  @bank_acc = BankAccount.new(bank_account_params)
	  @bank_acc.merchant = @merchant
	  check = @bank_acc.save and check

	  @merchant.information_check

    if check
	    render "success"
	  else
	    redirect_to action: "edit", alert: "Error creating merchant."
	  end

	end

	def merchant_params
	  params.require(:merchant).permit(:name, :website, :email, :city, :address, :office_status, :type_of_product, :price_range, :time_since_started, :ownership_type, :revenues_each_month, :credit_card_payment_ratio)
	end

	def merchant_customer_support_params
		params.require(:merchant_customer_support).permit(:email, :telephone, :emergency)
	end

	def merchant_operational_params
		params.require(:merchant_operational).permit(:email, :telephone, :emergency)
	end

	def merchant_pic_params
		params.require(:merchant_pic).permit(:email, :name, :address, :telephone)
	end

	def merchant_owner_params
		params.require(:merchant_owner).permit(:email, :name, :address, :telephone)
	end

	def bank_account_params
		params.require(:bank_account).permit(:acc_number, :name, :acc_holder, :acc_type)
	end

end
