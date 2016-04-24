class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps null: false
      t.string(:email, null: false)
      t.string(:pass)
      t.string(:role)
    end
    add_reference(:merchants, :user)
    add_foreign_key(:merchants, :users, column: :user_id)
  end
end
