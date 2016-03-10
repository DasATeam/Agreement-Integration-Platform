class AddMerchantToMerchantCustomerSupport < ActiveRecord::Migration
  def change
    add_reference :merchant_customer_supports, :merchant, index: true, foreign_key: true
    add_foreign_key :merchant_customer_supports, :merchant
  end
end
