class CreateMerchantOperationals < ActiveRecord::Migration
  def change
    create_table :merchant_operationals do |t|
      t.string :email, null: false
      t.string :telephone
      t.string :emergency
      t.references(:merchant, foreign_key: true)
    end
  end
end
