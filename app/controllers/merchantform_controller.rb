class MerchantformController < ApplicationController
	before_action :require_merchant

	def edit
		@user = User.find(session[:user_id])
		@merchant = @user.merchant
	end

	def update
		current_user
		check = true
	  @merchant = @current_user.merchant

	  puts 'AJSHDKASJHDKASJDHAKSJDHKASJDHKASJD'
	  puts 'kalo masuk general'
	  puts params[:save_general]
	  puts 'kalo masuk pic'
	  puts params[:save_pic]
	  puts 'kalo masuk operational'
	  puts params[:save_operational]
	  puts 'kalo masuk cs'
	  puts params[:save_cs]
	  puts 'kalo masuk owner'
	  puts params[:save_owner]
	  puts 'kalo masuk bank_acc'
	  puts params[:save_bank_acc]
	  puts 'check merchant pic ada apa kaga'
	  puts @merchant.merchant_pic
	  puts 'DONEEEEEE'

		if params[:save_general]
    	@merchant.update(merchant_params)
	  	check = @merchant.save and check
    elsif params[:save_pic]
  		if @merchant.merchant_pic
  			puts 'masuk if, update'
  			merchant_pic = @merchant.merchant_pic
  			merchant_pic.update(merchant_pic_params)
  		else
  			puts 'masuk else, bikin baru'
				merchant_pic = MerchantPic.new(merchant_pic_params)
				puts merchant_pic_params
	  		merchant_pic.merchant = @merchant
	  		puts '?'
  		end
  			check = merchant_pic.save and check
    elsif params[:save_operational]
    	if 
  			merchant_operational = @merchant.merchant_operational
  			merchant_operational.update(merchant_operational_params)
  		else
				merchant_operational = MerchantOperational.new(merchant_pic_params)
	  		merchant_operational.merchant = @merchant	
  		end
  			check = merchant_operational.save and check
    elsif params[:save_cs]
    	if 
  			merchant_cs = @merchant.merchant_cs
  			merchant_cs.update(merchant_customer_support_params)
  		else
				merchant_cs = MerchantCustomerSupport.new(merchant_customer_support_params)
	  		merchant_cs.merchant = @merchant	
  		end
  			check = merchant_cs.save and check
    elsif params[:save_owner]
    	if 
  			merchant_owner = @merchant.merchant_owner
  			merchant_owner.update(merchant_owner_params)
  		else
				merchant_owner = MerchantOwner.new(merchant_owner_params)
	  		merchant_owner.merchant = @merchant	
  		end
  			check = merchant_owner.save and check
    elsif params[:save_bank_acc]
    	if 
  			merchant_bank_account = @merchant.merchant_bank_account
  			merchant_bank_account.update(bank_account_params)
  		else
				merchant_bank_account = BankAccount.new(bank_account_params)
	  		merchant_bank_account.merchant = @merchant	
  		end
  			check = merchant_bank_account.save and check
    end

    render "success"
	end

	# def update
	#   check = true
	#   @user = User.find(session[:user_id])
	#   @merchant = @user.merchant
	#   @merchant.update(merchant_params)
	#   check = @merchant.save and check

	#   @merchant_cs = MerchantCustomerSupport.new(merchant_customer_support_params)
	#   @merchant_cs.merchant = @merchant
	#   check = @merchant_cs.save and check

	#   @merchant_op = MerchantOperational.new(merchant_operational_params)
	#   @merchant_op.merchant = @merchant
	#   check = @merchant_op.save and check

	#   @merchant_pic = MerchantPic.new(merchant_pic_params)
	#   @merchant_pic.merchant = @merchant
	#   check = @merchant_pic.save and check

	#   @merchant_owner = MerchantOwner.new(merchant_owner_params)
	#   @merchant_owner.merchant = @merchant
	#   check = @merchant_owner.save and check

	#   @bank_acc = BankAccount.new(bank_account_params)
	#   @bank_acc.merchant = @merchant
	#   check = @bank_acc.save and check

	#   @merchant.information_check

 #    if check
	#     render "success"
	#   else
	#     redirect_to action: "edit", alert: "Error creating merchant."
	#   end

	# end

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

	# def save_general

	# end

end
