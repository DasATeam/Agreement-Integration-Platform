class AddMerchantToBankAccount < ActiveRecord::Migration
  def change
    add_reference :bank_accounts, :merchant, index: true, foreign_key: true
    add_foreign_key :bank_accounts, :merchant
  end
end
