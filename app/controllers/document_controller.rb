class DocumentController < ApplicationController
  before_action :require_merchant , only: [:index, :upload]

  def index
    @user = current_user
    @merchant = @user.merchant
    @merchant_documents = @merchant.merchant_documents
    @is_document_completed = @merchant.documents_is_completed
    @agreement = @merchant.agreements.first
    @has_agreed = @agreement.has_agree
  end

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
        if @merchant_document.merchant.documents_is_completed
          redirect_to controller: 'term', action: "index"
          return
        end
      end
    end
    redirect_to action: "index"
  end

  def download
    @user = current_user
    @merchant_documents = @user.merchant.merchant_documents
    @channels = @user.merchant.agreements.first.agreement_channels
    @documents = []

    # Get DocumentTypes id
    @merchant_documents.each do |merchant_document|
      if ( merchant_document.document_type.is_additional )
        @documents.push({doc: merchant_document.document_type, link: merchant_document.document_type.link})
      end
    end
  end
end
