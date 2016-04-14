class User < ActiveRecord::Base
	has_one(:merchant)
  has_one(:sales)
end
