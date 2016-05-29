# == Schema Information
#
# Table name: merchant_operationals
#
#  id           :integer          not null, primary key
#  email        :string           not null
#  telephone    :string
#  emergency    :string
#  merchant_id  :integer
#  is_completed :boolean
#

require 'test_helper'

class MerchantOperationalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
