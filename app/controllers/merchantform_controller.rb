class MerchantformController < ApplicationController

	def edit
		
	end

	def update
	   check = true
	   @merchant = Merchant.find(session[:user_id])
	   @merchant.update(merchant_params)
	   puts merchant_params
	   check = @merchant.save and check

	   @merchantcs = MerchantCustomerSupport.new(merchantcustomersupport_params)
	   @merchantcs.merchant = @merchant
	   check = @merchantcs.save and check

	   @merchantop = MerchantOperational.new(merchantoperational_params)
	   @merchantop.merchant = @merchant
	   check = @merchantop.save and check

	   @merchantpic = MerchantPic.new(merchantpic_params)
	   @merchantpic.merchant = @merchant
	   check = @merchantpic.save and check

	   @merchantowner = MerchantOwner.new(merchantowner_params)
	   @merchantowner.merchant = @merchant
	   check = @merchantowner.save and check

	   @bankacc = BankAccount.new(bankaccount_params)
	   @bankacc.merchant = @merchant
	   check = @bankacc.save and check

	   
	   #uncomment if want to handle error
    	 if check
	          render "success"
	     else
	          redirect_to action: "edit", alert: "Error creating merchant."
	      end

	end

	def merchant_params
	   params.require(:merchant).permit(:name, :website, :email, :city, :address, :officestatus, :typeofproduct, :pricerange, :timesincestarted, :ownershiptype, :revenueseachmonth, :creditcardpaymentratio)
	end

	def merchantcustomersupport_params
		params.require(:merchantcustomersupport).permit(:email, :telephone, :emergency)
	end

	def merchantoperational_params
		params.require(:merchantoperational).permit(:email, :telephone, :emergency)
	end

	def merchantpic_params
		params.require(:merchantpic).permit(:email, :name, :address, :telephone)
	end

	def merchantowner_params
		params.require(:merchantowner).permit(:email, :name, :address, :telephone)
	end

	def bankaccount_params
		params.require(:bankaccount).permit(:accnumber, :name, :accholder, :acctype)
	end
	
end
