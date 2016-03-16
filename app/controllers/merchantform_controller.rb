class MerchantformController < ApplicationController

	def edit

	end

	def update
	   @merchant = Merchant.find(session[:user_id])
	   @merchant.update(merchant_params)
	   @merchant.save

	   @merchantcs = MerchantCustomerSupport.new()
	   @merchantcs.merchant = @merchant
	   @merchantcs.save

	   @merchantop = MerchantOperational.new()
	   @merchantop.merchant = @merchant
	   @merchantop.save

	   @merchantpic = MerchantPic.new()
	   @merchantpic.merchant = @merchant
	   @merchantpic.save	   

	   @merchantowner = MerchantOwner.new()
	   @merchantowner.merchant = @merchant
	   @merchantowner.save

	   @bankacc = BankAccount.new()
	   @bankacc.merchant = @merchant
	   @bankacc.save

	   
	   #if elsenya msh error, sisanya fine
	   # 	if @merchant.save
	   #      redirect_to @merchant, alert: "Merchant created successfully."
	   #  else
	   #      redirect_to new_merchant_path, alert: "Error creating merchant."
	   #  end

	end

	def merchant_params
	   params.require(:merchant).permit(:userid, :name, :website, :email, :city, :address, :officestatus, :typeofproduct, :pricerange, :timesincestarted, :ownershiptype, :revenueseachmonth, :creditcardpaymentratio)
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
