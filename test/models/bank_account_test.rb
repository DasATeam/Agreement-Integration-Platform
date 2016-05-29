# == Schema Information
#
# Table name: bank_accounts
#
#  id          :integer          not null, primary key
#  acc_number  :string           not null
#  name        :string
#  acc_holder  :string
#  acc_type    :string
#  merchant_id :integer
#

require 'test_helper'

class BankAccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
