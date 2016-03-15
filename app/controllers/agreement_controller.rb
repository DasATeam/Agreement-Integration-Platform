class AgreementController < ApplicationController
	def new
		@channels = ChannelType.all()
	end

	def create
		#Create merchant and his account
		if  @user = User.create(user_params())
			if @merchant = Merchant.create(merchant_params())
				@user.merchant = @merchant
				@user.role = 'merchant'
				@user.save()
				
				require 'digest/md5'
				link = Digest::MD5.hexdigest(@user.email)
				@merchant.registrationlink = link
				@merchant.save()

				# Create channel
				date = Date.today
				if date.mon / 10 == 1
					month = "#{date.year}-#{date.mon}%"
				else
					month = "#{date.year}-0#{date.mon}%"
				end
				agreementsThisMonth = Agreement.where("created_at LIKE (?)", month)
				@agreement = Agreement.create(PKSNumber: "#{agreementsThisMonth.size + 1}/PKS-M/VT/#{to_roman(date.mon)}/#{date.year}")
				@agreement.merchant = @merchant
				@agreement.save()

				selectedChannels = channel_params()
				@channels = ChannelType.all()
				@channels.each do |channel|
					if selectedChannels[channel.id.to_s()] == "1"
						agreementChannel = AgreementChannel.create()
						agreementChannel.agreement = @agreement
						agreementChannel.channel_type = channel
						agreementChannel.save()
					end
				end
				
				render "info"
			end
		end
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

	private 
		def channel_params 
			params.require(:form).permit!
		end

end
