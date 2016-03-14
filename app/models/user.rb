class User < ActiveRecord::Base
	has_one(:merchant)
end
