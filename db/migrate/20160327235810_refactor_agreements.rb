class RefactorAgreements < ActiveRecord::Migration
  def change
    rename_column :agreements, :PKSNumber, :pks_number
    rename_column :agreements, :ApproverName, :approver_name
    rename_column :agreements, :ApproverRole, :approver_role
  end
end
