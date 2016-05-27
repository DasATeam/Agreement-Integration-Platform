class MerchantCustomerSupport < ActiveRecord::Base
	belongs_to(:merchant)
	validates :email, format: { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$\z/i, message: "email tidak sesuai format"}
	validates :telephone, presence: true
	validates :emergency, presence: true
	
	def check
  	self.is_completed = self.valid?
  	self.save
    return self.is_completed
  end

end
