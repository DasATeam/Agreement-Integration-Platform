class UserController < ApplicationController
	def merchant_new
		merchant = Merchant.find_by(registrationlink: params[:hash])
		user = merchant.user
		session[:user_id] = user.id

		render "test"
	end
end
