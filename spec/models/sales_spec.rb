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

require 'rails_helper'

RSpec.describe Sales, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
