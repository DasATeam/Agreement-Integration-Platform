class CreateSalesMerchants < ActiveRecord::Migration
  def change
    create_table :sales_merchants do |t|
      t.belongs_to :merchant, index: true
      t.belongs_to :sales, index: true
      t.timestamps null: false
    end
  end
end
