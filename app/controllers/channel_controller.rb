class ChannelController < ApplicationController
  before_action :require_sales
  
  # Handle Request : GET sales/agreement/:user_id/channel
  #
  #   Used to edit the channel
  #
  # == Returns:
  # GET::
  #   The edit page for the channels
  #   
  def edit
    @channels = ChannelType.all()
  end

  # Handle Request : POST sales/agreement/:user_id/channel
  #
  #   Used to save the channels
  #
  # == Returns:
  # POST::
  #   Redirect to the initial page
  #   
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

    redirect_to controller: "agreement", action:"sales_success_create", user_id: @user.id
  end

  private
    def channel_params
      params.require(:form).permit!
    end
end
