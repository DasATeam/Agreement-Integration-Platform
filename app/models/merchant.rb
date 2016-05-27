class Merchant < ActiveRecord::Base
	belongs_to(:user)
	has_many(:agreements)
	has_many(:merchant_documents)
	has_one(:merchant_customer_support)
	has_one(:merchant_operational)
	has_one(:merchant_owner)
	has_one(:merchant_pic)
	has_one(:bank_account)
	has_and_belongs_to_many(:sales, class_name: 'Sales', join_table: 'sales_merchants')
	
	validates :name, presence: true
	validates :website, presence: true
	validates :email, format: { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$\z/i,message: 'email tidak sesuai format'}
	validates :city, presence: true
	validates :address, presence: true
	validates :office_status, presence: true
	validates :type_of_product, presence: true
	validates :price_range, presence: true
	validates :time_since_started, presence: true
	validates :ownership_type, presence: true
	validates :revenues_each_month, presence: true
	validates :credit_card_payment_ratio, presence: true
	
	def check
		self.info_is_completed = self.valid?
		self.save
    return self.info_is_completed
	end

	def information_check
		all_complete = self.info_is_completed && self.merchant_customer_support.is_completed && self.merchant_owner.is_completed && self.merchant_pic.is_completed && self.merchant_operational.is_completed && self.merchant_operational.is_completed && self.bank_account.valid?
    return all_complete
  end

  def document_check
    self.merchant_documents.each do |doc|
      if !doc || doc.file?
        self.documents_is_completed = false
        self.save
        return self.documents_is_completed
      end
    end
    self.documents_is_completed = true
    self.save
    return self.documents_is_completed
  end


end
