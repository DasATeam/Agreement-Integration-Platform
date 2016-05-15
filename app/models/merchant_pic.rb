class MerchantPic < ActiveRecord::Base
	belongs_to(:merchant)

  validates(:email, format: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$\z/i)

  def check
    self.is_completed = self.email && !self.email.blank? && self.telephone && !self.telephone.blank? && self.valid?
    self.save
    return self.is_completed
  end
end
