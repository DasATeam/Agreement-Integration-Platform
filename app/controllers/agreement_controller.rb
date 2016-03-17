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
				
				#generate hash of regist link
				require 'digest/md5'
				link = Digest::MD5.hexdigest(@user.email)
				@merchant.registrationlink = link
				@merchant.save()

				# Create Agreement
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

				#listing needed document
				selectedChannels = channel_params()
				@channels = ChannelType.all()
				neededDocuments = Hash.new()
				#creating each selected channel
				@channels.each do |channel|
					if selectedChannels[channel.id.to_s()] == "1"
						agreementChannel = AgreementChannel.create()
						agreementChannel.agreement = @agreement
						agreementChannel.channel_type = channel
						agreementChannel.save()

						#listing needed documents
						channel.documents.each do |doc|
							puts doc
							puts doc.class
							if !neededDocuments.has_key?(doc.id)
								neededDocuments[doc.id]=doc
							end
						end
					end
				end

				# creating each needed document ot database
				neededDocuments.each_value do |doc|
					merchantDocument = MerchantDocument.new()
					merchantDocument.merchant = @merchant
					merchantDocument.agreement = @agreement
					merchantDocument.document_type = doc
					merchantDocument.save()
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
