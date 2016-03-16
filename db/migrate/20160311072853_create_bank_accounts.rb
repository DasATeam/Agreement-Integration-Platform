class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|

      t.string :accnumber, null: false
      t.string :name
      t.string :accholder
      t.string :acctype
      t.references(:merchant, foreign_key: true)
    end
  end
end
