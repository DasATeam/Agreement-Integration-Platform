class CreateDocumentLinks < ActiveRecord::Migration
  def change
    create_table :document_links do |t|
      t.timestamps null: false
      t.references(:document_types, foreign_key: true)
      t.string :link
    end

    change_table :document_types do |t|
      t.boolean :is_additional
    end
  end
end
