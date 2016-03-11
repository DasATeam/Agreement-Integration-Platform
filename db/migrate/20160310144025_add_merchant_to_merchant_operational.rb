class AddMerchantToMerchantOperational < ActiveRecord::Migration
  def change
    add_reference :merchant_operationals, :merchant, index: true, foreign_key: true
    add_foreign_key :merchant_operationals, :merchant
  end
end
