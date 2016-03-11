class MerchantformController < ApplicationController

	def create
	   @merchant = Merchant.new(merchant_params)
	   
	   # if @merchant.save
	   #   redirect_to :action => 'list'
	   # else
	   #   @subjects = Subject.all
	   #   render :action => 'new'
	   # end

	   #if elsenya msh error, sisanya fine
	   	if @merchant.save
	        redirect_to @merchant, alert: "Merchant created successfully."
	    else
	        redirect_to new_merchant_path, alert: "Error creating merchant."
	    end
	end

	def new
    	@merchant = Merchant.new
	end

	def merchant_params
	   params.require(:merchant).permit(:userid, :name, :website, :email, :city, :address, :officestatus, :typeofproduct, :pricerange, :timesincestarted, :ownershiptype, :revenueseachmonth, :creditcardpaymentratio)
	end

	def show
    	@merchant = Merchant.find(params[:id])
	end

end
