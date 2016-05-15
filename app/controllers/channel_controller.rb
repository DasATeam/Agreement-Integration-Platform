class ChannelController < ApplicationController
  before_action :require_sales
  
  def edit
    @channels = ChannelType.all()
  end

  def save_channel
    @user = User.find(params[:user_id])
    @merchant = @user.merchant
    @agreement = @merchant.agreements.first

    # Listing needed document
    selectedChannels = channel_params()
    @channels = ChannelType.all()
    neededDocuments = Hash.new()

    # Creating each selected channel
    @channels.each do |channel|
      if selectedChannels[channel.id.to_s()] == "1"
        agreementChannel = AgreementChannel.create()
        agreementChannel.agreement = @agreement
        agreementChannel.channel_type = channel
        agreementChannel.save()

        # Listing needed documents
        channel.documents.each do |doc|
          puts doc
          puts doc.class
          if !neededDocuments.has_key?(doc.id)
            neededDocuments[doc.id]=doc
          end
        end
      end
    end

  # Creating each needed document to database
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
