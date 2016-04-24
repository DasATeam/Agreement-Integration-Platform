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
end
