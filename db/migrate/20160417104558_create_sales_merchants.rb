class CreateSalesMerchants < ActiveRecord::Migration
  def change
    create_table :sales_merchants do |t|
      t.belongs_to :merchant, foreign_key: true,  index: true
      t.belongs_to :sale, foreign_key: true, index: true
      t.timestamps null: false
    end
  end
end
