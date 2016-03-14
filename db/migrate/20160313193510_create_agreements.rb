class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.timestamps null: false
      t.string(:PKSNumber, null: false)
      t.string(:ApproverName)
      t.string(:ApproverRole)
      t.references(:merchant, foreign_key: true)
    end
  end
end
