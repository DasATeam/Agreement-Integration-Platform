class AddMerchantToMerchantOwner < ActiveRecord::Migration
  def change
    add_reference :merchant_owners, :merchant, index: true, foreign_key: true
    add_foreign_key :merchant_owners, :merchant
  end
end
