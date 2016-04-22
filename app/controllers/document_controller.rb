class DocumentController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @merchant = @user.merchant
    @merchant_documents = @merchant.merchant_documents
  end

  def upload
    @merchant_document = nil
    params[:document].each do |id, d|
      @merchant_document = MerchantDocument.find(id)
      File.open(Rails.root.join('public', 'uploads', d.original_filename), 'wb') do |file|
        file.write(d.read)
      end

      @merchant_document.path = File.join('/','uploads', d.original_filename)
      @merchant_document.save
    end

    if @merchant_document
      @merchant_document.merchant.document_check
    end

    redirect_to action: "index"
  end
end
