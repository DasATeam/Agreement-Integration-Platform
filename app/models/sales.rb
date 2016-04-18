class Sales < ActiveRecord::Base
  self.table_name = "sales"
  belongs_to(:user)
  has_many(:merchant, through: :sales_merchants)
end
