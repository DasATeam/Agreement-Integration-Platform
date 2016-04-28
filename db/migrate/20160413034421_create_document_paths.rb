class CreateDocumentPaths < ActiveRecord::Migration
  def change
    create_table :document_paths do |t|
      t.timestamps null: false
      t.references(:merchant_documents, foreign_key: true, index: true)
      t.string :path
    end
  end
end
