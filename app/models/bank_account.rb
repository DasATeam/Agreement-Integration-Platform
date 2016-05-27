class BankAccount < ActiveRecord::Base
	belongs_to(:merchant)

  validates :acc_number, presence: true
  validates :name, presence: true
  validates :acc_holder, presence: true
  validates :acc_type, presence: true
  validates :merchant_id, presence: true

end