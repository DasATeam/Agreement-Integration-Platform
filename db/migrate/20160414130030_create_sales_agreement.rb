class CreateSalesAgreement < ActiveRecord::Migration
  def change
    create_table :sales_agreements do |t|
      t.references(:sales, foreign_key: true, index: true)
      t.references(:agreement, foreign_key: true, index: true)
    end
  end
end
