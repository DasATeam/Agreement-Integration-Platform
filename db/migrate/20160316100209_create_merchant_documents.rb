class CreateMerchantDocuments < ActiveRecord::Migration
  def change
    create_table :merchant_documents do |t|

      t.timestamps null: false
    end
  end
end
