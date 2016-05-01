class AddFileToMerchantDocuments < ActiveRecord::Migration
  def change
    add_column :merchant_documents, :File, :string
  end
end
