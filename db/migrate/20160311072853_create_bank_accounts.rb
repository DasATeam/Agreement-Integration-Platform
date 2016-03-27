class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.string :acc_number, null: false
      t.string :name
      t.string :acc_holder
      t.string :acc_type
      t.references(:merchant, foreign_key: true)
    end
  end
end