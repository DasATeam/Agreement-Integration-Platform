class SalesMerchant < ActiveRecord::Base
  belongs_to(:merchant)
  belongs_to(:sales)
end
