class CreateDocumentPaths < ActiveRecord::Migration
  def change
    create_table :document_paths do |t|
      t.timestamps null: false
<<<<<<< HEAD
      t.references(:merchant_documents, foreign_key: true, index: true)
=======
      t.references(:merchant_document, foreign_key: true, index: true)
>>>>>>> master
      t.string :path
    end
  end
end
