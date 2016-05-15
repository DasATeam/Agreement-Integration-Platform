class Sales < ActiveRecord::Base
  self.table_name = "sales"
  belongs_to(:user)
  has_and_belongs_to_many(:merchants, class_name: 'Merchant', join_table: 'sales_merchants')
end
