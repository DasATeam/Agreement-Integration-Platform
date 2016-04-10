class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.string :isi
      t.string :nomor
      t.references(:point, foreign_key: true, index: true)
      t.timestamps null: false
    end
  end
end
