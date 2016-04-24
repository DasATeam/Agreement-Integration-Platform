class CreateMerchantOwners < ActiveRecord::Migration
  def change
    create_table :merchant_owners do |t|
      t.string :email, null: false
      t.string :name
      t.string :address
      t.string :telephone
      t.references(:merchant, foreign_key: true)
    end
  end
end
