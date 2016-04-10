class BankAccount < ActiveRecord::Base
	belongs_to(:merchant)
end
