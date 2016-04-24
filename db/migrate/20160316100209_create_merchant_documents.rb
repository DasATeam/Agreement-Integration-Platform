class CreateMerchantDocuments < ActiveRecord::Migration
  def change
    create_table :merchant_documents do |t|
      t.timestamps null: false
      t.references(:merchant, foreign_key: true, index: true)
      t.references(:agreement, foreign_key: true, index: true)
      t.references(:document_type, foreign_key: true)
      t.string(:path)
    end
  end
end
