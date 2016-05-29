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

class BankAccount < ActiveRecord::Base
	belongs_to(:merchant)

  validates :acc_number, presence: true
  validates :name, presence: true
  validates :acc_holder, presence: true
  validates :acc_type, presence: true

end
