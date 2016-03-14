class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.timestamps null: false
	  t.string :name
	  t.string :website
	  t.string :email
	  t.string :city	
	  t.string :address
	  t.integer :officestatus
	  t.string :typeofproduct
	  t.string :pricerange
	  t.date :timesincestarted
	  t.integer :ownershiptype
	  t.decimal :revenueseachmonth
	  t.decimal :creditcardpaymentratio
	  t.string :registrationlink
    end
  end
end
