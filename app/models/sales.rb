# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  user_id    :integer
#

class Sales < ActiveRecord::Base
  self.table_name = "sales"
  belongs_to(:user)
  has_and_belongs_to_many(:merchants, class_name: 'Merchant', join_table: 'sales_merchants')
end
