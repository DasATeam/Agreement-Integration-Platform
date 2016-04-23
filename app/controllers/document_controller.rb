class DocumentController < ApplicationController
  def index
    @merchant = Merchant.find(session[:user_id])
    @merchant_documents = @merchant.merchant_documents
  end

  def upload
    params[:document].each do |id, d|
      @merchant_document = MerchantDocument.find(id)
      File.open(Rails.root.join('public', 'uploads', d.original_filename), 'wb') do |file|
        file.write(d.read)
      end

      @merchant_document.path = File.join('/','uploads', d.original_filename)
      @merchant_document.save
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
        puts merchant_document.document_type.link
        puts "HAHAHAHAHAHHAAH"
      end
    end
  end
end
