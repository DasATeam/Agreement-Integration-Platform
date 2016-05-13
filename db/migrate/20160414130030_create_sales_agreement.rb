class CreateSalesAgreement < ActiveRecord::Migration
  def change
    create_table :sales_agreements do |t|
      t.references(:sales, index: true)
      t.references(:agreement, index: true)
    end
  end
end
