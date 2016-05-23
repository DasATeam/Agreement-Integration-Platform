class UserController < ApplicationController
  def merchant_set_password
    @merchant = Merchant.find_by(registration_link: params[:hash])
    @user = User.find(@merchant.user_id)

    if(params[:pass])
      if(params[:pass][:password] != params[:pass][:password_confirmation])
        flash[:error] = 'Kedua password tidak sama';
      elsif(params[:pass][:password].length < 8)
        flash[:error] = 'password harus memiliki 8 karakter atau lebih'
      else
        @user.set_password(params[:pass][:password])
        @user.save
        @merchant.registration_link = ''
        @merchant.save

        redirect_to(controller: 'merchantform', action: 'edit')
      end
    end
  end
end
