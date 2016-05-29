# == Schema Information
#
# Table name: agreement_channels
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  agreement_id    :integer
#  channel_type_id :integer
#  customprice     :string
#

require 'test_helper'

class AgreementChannelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
