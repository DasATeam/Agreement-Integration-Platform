class RefactorMerchant < ActiveRecord::Migration
  def change
  	rename_column :merchants, :officestatus, :office_status
		rename_column :merchants, :typeofproduct, :type_of_product
		rename_column :merchants, :pricerange, :price_range
		rename_column :merchants, :timesincestarted, :time_since_started
		rename_column :merchants, :ownershiptype, :ownership_type
		rename_column :merchants, :revenueseachmonth, :revenues_each_month
		rename_column :merchants, :creditcardpaymentratio, :credit_card_payment_ratio
		rename_column :merchants, :registrationlink, :registration_link
  end
end