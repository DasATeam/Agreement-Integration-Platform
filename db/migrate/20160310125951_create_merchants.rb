class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.timestamps null: false
		  t.string :name
		  t.string :website
		  t.string :email
		  t.string :city
		  t.string :address
		  t.integer :office_status
		  t.string :type_of_product
		  t.string :price_range
		  t.date :time_since_started
		  t.integer :ownership_type
		  t.decimal :revenues_each_month
		  t.decimal :credit_card_payment_ratio
		  t.string :registration_link
    end
    add_reference(:merchants, :sales)
  end
end
