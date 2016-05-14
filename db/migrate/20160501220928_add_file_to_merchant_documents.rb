class AddFileToMerchantDocuments < ActiveRecord::Migration
  def change
    add_column :merchant_documents, :file, :string
  end
end
