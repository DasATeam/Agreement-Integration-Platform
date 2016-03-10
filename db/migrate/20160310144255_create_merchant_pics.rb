class CreateMerchantPics < ActiveRecord::Migration
  def change
    create_table :merchant_pics do |t|

      t.string :email, null: false
      t.string :name
      t.string :address
      t.string :telephone
    end
  end
end
