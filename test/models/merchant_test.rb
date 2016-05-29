# == Schema Information
#
# Table name: merchants
#
#  id                        :integer          not null, primary key
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  name                      :string
#  website                   :string
#  email                     :string
#  city                      :string
#  address                   :string
#  office_status             :integer
#  type_of_product           :string
#  price_range               :string
#  time_since_started        :date
#  ownership_type            :integer
#  revenues_each_month       :decimal(, )
#  credit_card_payment_ratio :decimal(, )
#  registration_link         :string
#  user_id                   :integer
#  info_is_completed         :boolean
#  documents_is_completed    :boolean
#

require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
