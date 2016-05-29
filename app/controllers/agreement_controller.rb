class AgreementController < ApplicationController
	before_action :require_sales

	# Handle Request : GET sales/agreement/new
	#
	#   For Sales so can create new agreement by inputing required fields in the form
	#
	# == Returns:
	# GET::
	#   Webpage to input agreement information in the form
	#   
	def new
	end

	# Handle Request : POST sales/agreement/new
	#
	#    Post handler for form creating new agreement
	#
	# == Returns:
	# POST::
	#   Redirecting to Channels option for the agreement
	#   
	def create
		# Create merchant and his account
		if  @user = User.new(user_params())
			#if @merchant = Merchant.create(merchant_params())
				@merchant = Merchant.new(merchant_params())
				@sales = current_user.sales
				@user.merchant = @merchant
				@user.role = 'merchant'
				@user.save(validate: false)
				@merchant.save(validate: false)

				# Generate hash of registration link
				require 'digest/md5'
				link = Digest::MD5.hexdigest(@user.email)
				@merchant.registration_link = link
				sales = current_user.sales
				sales.merchants << @merchant
				@merchant.info_is_completed = false
				@merchant.documents_is_completed = false
				@merchant.save(validate: false)

				# Create Agreement
				date = Date.today
				if date.mon / 10 == 1
					month = "#{date.year}-#{date.mon}"
				else
					month = "#{date.year}-0#{date.mon}"
				end

				# Get the number of agreements made this month
				agreementsThisMonth = Agreement.all.select do |x|
					x.created_at.to_s[0..6] == month
				end

				params.require(:form).permit(:implementation)
				@agreement = Agreement.create(pks_number: "#{agreementsThisMonth.size + 1}/PKS-M/VT/#{to_roman(date.mon)}/#{date.year}", implementation: params[:form][:implementation])
				@agreement.merchant = @merchant
				@agreement.has_agree = false
				@agreement.save()
				redirect_to controller: "channel", action:"edit", user_id: @user.id
			end
		end

	# Handle Request : GET sales/agreement/:user_id/info
	#
	#   Show information about agreement that has been succesfully created
	#
	# == Returns:
	# GET::
	#   Webpage showing information about agreement
	def sales_success_create
		@user = User.find(params[:user_id])
		@merchant = @user.merchant
		@agreement = @merchant.agreements.first
	end

	# Handle Request : GET merchant/details/:merchant_id
	#
	#   Show detailed information about a merchant and their agreement. Providing feature to modify the agreement and merchant information
	#
	# == Returns:
	# GET::
	#   Webpage showing the information
	def merchant_details
		if params[:merchant_id] != nil
			ik = params[:merchant_id].to_i
      @merchant = Merchant.find(ik)
			@merchant_documents = @merchant.merchant_documents
      @agreement = @merchant.agreements.first
      @channels = @agreement.agreement_channels
      @required_docs = @agreement.merchant_documents
	  end
	end

	# Handle Request : POST merchant/details/:merchant_id
	#
	#   Post handler for submitted form to modify merchant document
	#
	# == Returns:
	# POST::
	#   Redirecting to Merchant details information after succeded saving the documents
	#   
	def upload
		@merchant_document = nil
		if params[:document]
			params[:document].each do |id, file|
				@merchant_document = MerchantDocument.find(id)
				@merchant_document.file = file
				@merchant_document.save!
			end

			if @merchant_document
				@merchant_document.merchant.document_check
			end
		end

		redirect_to action: "merchant_details", :anchor => 'documents'
	end

	# Handle Request : GET merchant/details/:merchant_id/change/:haft
	#
	#   Providing view for sales allowing them to change specific pricing for specific agrements
	#
	# == Returns:
	# GET::
	#   Webpage containing form to change channel pricing
	def change_price
	    if params[:haft] != nil
        @ik = params[:haft].to_i
        @channel = AgreementChannel.find(@ik)
        @merchant = Merchant.find(params[:merchant_id].to_i)
      end
	end

	# Handle Request : POST merchant/details/:merchant_id/change/:haft
	#
	#   Post handler for submitted form to change channel pricing
	#
	# == Returns:
	# POST::
	#   Redirecting to merchant details information
	def custom_price
	    @editedChannel = AgreementChannel.find(params[:haft].to_i)
	    @editedChannel.customprice = params[:form][:price]
	    @editedChannel.save()

	    redirect_to controller:"agreement", action: "merchant_details", merchant_id: params[:merchant_id]
	end

	private
		def to_roman(number)
			roman_numbers = {
				12 => "XII",
				11 => "XI",
				10 => "X",
				9 => "IX",
				8 => "VIII",
				7 => "VII",
				6 => "VI",
				5 => "V",
				4 => "IV",
				3 => "III",
				2 => "II",
				1 => "I"
			}
			return roman_numbers[number]
		end

	private
		def user_params
			params.require(:form).permit(:email)
		end

	private
		def merchant_params
			params.require(:form).permit(:name, :website)
		end
end
