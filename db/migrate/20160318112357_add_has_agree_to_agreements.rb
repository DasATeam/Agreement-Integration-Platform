class AddHasAgreeToAgreements < ActiveRecord::Migration
  def change
    change_table :agreements do |t|
      t.boolean :has_agree
    end
  end
end
