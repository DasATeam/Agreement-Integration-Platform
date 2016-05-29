# == Schema Information
#
# Table name: merchant_pics
#
#  id           :integer          not null, primary key
#  email        :string           not null
#  name         :string
#  address      :string
#  telephone    :string
#  merchant_id  :integer
#  is_completed :boolean
#

require 'test_helper'

class MerchantPicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
