class CreateMerchantCustomerSupports < ActiveRecord::Migration
  def change
    create_table :merchant_customer_supports do |t|

      t.string :email, null: false
      t.string :telephone
      t.string :emergency
    end
  end
end
