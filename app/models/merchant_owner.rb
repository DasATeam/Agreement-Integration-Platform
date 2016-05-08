class MerchantOwner < ActiveRecord::Base
	belongs_to(:merchant)
	validates :email, format: { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$\z/i,
    message: "email tidak sesuai format"}
	validates :telephone, format: {with: /\d[0-9]\)*\z/,
		message: "Only positive number without spaces are allowed"}
	#validates :is_completed, presence: true
	#validates :is_completed, inclusion: { in: [true, false] }
	#validates :is_completed, exclusion: { in: [nil] }
	def check
	self.is_completed = self.valid?
	self.save
	end
  # validates(:email, format: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$\z/i)

  #def check
  #  self.is_completed = self.email && !self.email.blank? && self.telephone && !self.telephone.blank? && self.valid?
  #  self.save
  #  return self.is_completed
  #end
end
