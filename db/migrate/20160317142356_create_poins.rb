class CreatePoins < ActiveRecord::Migration
  def change
    create_table :poins do |t|
      t.string :isi_poin
      t.string :nomor_poin
      t.references(:poin, foreign_key: true, index: true)
      # t.references(:pasal, foreign_key: true, index: true)
      t.timestamps null: false
    end
  end
end
