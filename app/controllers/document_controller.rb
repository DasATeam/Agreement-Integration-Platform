class DocumentController < ApplicationController
  before_action :require_merchant

  def index
    @user = User.find(session[:user_id])
    @merchant = @user.merchant
    @merchant_documents = @merchant.merchant_documents
  end

  def upload
    @merchant_document = nil
    params[:document].each do |id, file|
      @merchant_document = MerchantDocument.find(id)
      @merchant_document.file = file
      @merchant_document.save!
    end

    if @merchant_document
      @merchant_document.merchant.document_check
    end

    redirect_to action: "index"
  end

  def download
    user = User.find(session[:user_id])
    merchant_documents = user.merchant.merchant_documents
    @channels = user.merchant.agreements.first.agreement_channels
    @documents = []
    
    # Get DocumentTypes id
    merchant_documents.each do |merchant_document|
      if ( merchant_document.document_type.is_additional )
        @documents.push({doc: merchant_document.document_type, link: merchant_document.document_type.link})
      end
    end
  end
end
