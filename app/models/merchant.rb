class Merchant < ActiveRecord::Base
	belongs_to(:user)
	has_many(:agreements)
	has_many(:merchant_documents)
	has_one(:merchant_customer_support)
	has_one(:merchant_operational)
	has_one(:merchant_owner)
	has_one(:merchant_pic)
	has_one(:bank_account)
  has_and_belongs_to_many(:sales, class_name: 'Sales', join_table: 'sales_agreements')

  def document_check
    self.merchant_documents.each do |doc|
      if !doc || doc.path.blank? 
        self.document_is_completed = false    
      end
    end
    return self.document_is_completed
  end

  def information_check
    self.info_is_completed = self.name && self.name.blank? && self.website && self.website.blank? && self.email && self.email.blank? &&
    self.city && self.city.blank? && self.address && self.address.blank? && self.office_status && self.office_status.blank? &&
    self.type_of_product && self.type_of_product.blank? && self.price_range && self.price_range.blank? &&
    self.time_since_started && self.time_since_started.blank? && self.ownership_type && self.ownership_type.blank? &&
    self.revenues_each_month && self.revenues_each_month.blank? && self.credit_card_payment_ratio self. && self.credit_card_payment_ratio.blank? &&
    self.registration_link && self.registration_link.blank?

    self.info_is_completed = self.info_is_completed && self.merchant_customer_support.is_completed && self.merchant_owner.is_completed && self.merchant_pic.is_completed && self.merchant_operational.is_completed
    return self.info_is_completed

end
