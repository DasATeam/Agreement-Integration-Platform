# == Schema Information
#
# Table name: channel_types
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :string
#  name       :string
#  partner    :string
#  charge     :string
#

require 'test_helper'

class ChannelTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
