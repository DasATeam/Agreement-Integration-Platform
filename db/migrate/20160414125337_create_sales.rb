class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.timestamps null: false
      t.string :name
      t.references(:user, foreign_key: true, index: true)
    end
  end
end
