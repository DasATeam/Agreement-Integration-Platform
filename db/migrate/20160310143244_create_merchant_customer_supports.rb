class CreateMerchantCustomerSupports < ActiveRecord::Migration
  def change
    create_table :merchant_customer_supports do |t|
      t.string :email, null: false
      t.string :telephone
      t.string :emergency
      t.references(:merchant, foreign_key: true)
    end
  end
end
