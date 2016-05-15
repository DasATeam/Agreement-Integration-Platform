class CreateSalesMerchants < ActiveRecord::Migration
  def change
    create_table :sales_merchants do |t|
      t.belongs_to :merchant, foreign_key: true,  index: true
      t.belongs_to :sales,  index: true
      t.timestamps null: false
    end
    add_foreign_key :sales_merchants, :sales, column: 'sales_id'
  end
end
