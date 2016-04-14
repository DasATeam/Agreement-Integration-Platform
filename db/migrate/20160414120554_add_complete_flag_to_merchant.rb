class AddCompleteFlagToMerchant < ActiveRecord::Migration  
  def change
    change_table :merchants do |t|
      t.boolean :info_is_completed
      t.boolean :documents_is_completed
    end

    change_table :merchant_operationals do |t|
      t.boolean :is_completed
    end

    change_table :merchant_pics do |t|
      t.boolean :is_completed
    end

    change_table :merchant_customer_supports do |t|
      t.boolean :is_completed
    end

    change_table :merchant_owners do |t|
      t.boolean :is_completed
    end
  end

end
