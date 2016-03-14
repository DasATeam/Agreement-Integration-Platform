class AgreementController < ApplicationController
	def new
		@channels = ChannelType.all
	end

	def create
		@user
		@merchant
		if  @user = User.create(user_params())
			if @merchant = Merchant.create(merchant_params())
				require 'digest/md5'
				
				@user.merchant = @merchant
				@user.role = 'merchant'
				@user.save()
				
				link = Digest::MD5.hexdigest(@user.email)
				@merchant.registrationlink = link
				@merchant.save()

				# selectedChannel = channel_params()
				# selectedChannel.each do |key, id|
				# 	if id == "1"
				# 		AgreementChannel.create()
				# 	end
				# end
					

				redirect_to(action: "info", id: @user.id)
			end
		end
	end

	def info

	end


	private 
		def user_params 
			params.require(:form).permit(:email) 
		end

	private 
		def merchant_params 
			params.require(:form).permit(:name, :website) 
		end

	private 
		def channel_params 
			params.require(:form).permit('6','7','8','9','10') 
		end

end
