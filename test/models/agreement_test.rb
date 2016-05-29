# == Schema Information
#
# Table name: agreements
#
#  id             :integer          not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  pks_number     :string           not null
#  approver_name  :string
#  approver_role  :string
#  merchant_id    :integer
#  has_agree      :boolean
#  implementation :integer
#

require 'test_helper'

class AgreementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
