class RefactorBankAccount < ActiveRecord::Migration
  def change
  	rename_column :bank_accounts, :accnumber, :acc_number
		rename_column :bank_accounts, :accholder, :acc_holder
		rename_column :bank_accounts, :acctype, :acc_type
  end
end
