class AddAgreementImplementation < ActiveRecord::Migration
  def change
    add_column :agreements, :implementation, :integer
  end
end
