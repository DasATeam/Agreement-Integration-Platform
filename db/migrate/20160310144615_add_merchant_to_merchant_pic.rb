class AddMerchantToMerchantPic < ActiveRecord::Migration
  def change
    add_reference :merchant_pics, :merchant, index: true, foreign_key: true
    add_foreign_key :merchant_pics, :merchant
  end
end
