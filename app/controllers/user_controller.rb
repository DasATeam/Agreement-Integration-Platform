class UserController < ApplicationController
  def merchant_set_password
    merchant = Merchant.find_by(registration_link: params[:hash])
    user = merchant.user
    if(params[:pass])
      user.pass = params[:pass][:password]
      if(params[:pass][:password] != params[:pass][:password_confirmation])
        flash[:error] = "Kedua password tidak sama";
      elsif(params[:pass][:password].length < 6 || params[:pass][:password].length > 20)
        flash[:error] = 'password harus memiliki 6 - 20 karakter'
      elsif(params[:pass][:password].match(/\w*(([a-z]+\d+)|(\d+[a-z]+))\w*/i) )
        flash[:error] = 'password harus mengandung huruf dan angka'
      else
        user.set_password(params[:pass][:password])
        merchant.registration_link = ""
        merchant.save

        redirect_to(controller: "merchantform", action: "edit")
      end
    end

  end

end
