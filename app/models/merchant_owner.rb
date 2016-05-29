# == Schema Information
#
# Table name: merchant_owners
#
#  id           :integer          not null, primary key
#  email        :string           not null
#  name         :string
#  address      :string
#  telephone    :string
#  merchant_id  :integer
#  is_completed :boolean
#

class MerchantOwner < ActiveRecord::Base
	belongs_to(:merchant)
	validates :email, format: { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$\z/i, message: "email tidak sesuai format"}
	validates :telephone, presence: true

	def check
    self.is_completed = self.valid?
    self.save
    return self.is_completed
  end
end
