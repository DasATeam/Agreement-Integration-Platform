class MerchantController < ApplicationController
before_action :require_merchant, only: [:edit, :update]

  def edit
    @is_general = params[:save_general] || params[:save_pic] || params[:save_owner] || params[:save_cs] || params[:save_operational] || params[:save_bank_acc]
    @active = 'tab-pane fade in active'
    @non_active = 'tab-pane fade'
    @user = User.find(session[:user_id])
    @merchant = @user.merchant
    
    @merchant_pic = @merchant.merchant_pic ? @merchant.merchant_pic : MerchantPic.new()
    @merchant_owner = @merchant.merchant_owner ? @merchant.merchant_owner : MerchantOwner.new()
    @merchant_operational = @merchant.merchant_operational ? @merchant.merchant_operational : MerchantOperational.new()
    @merchant_cs = @merchant.merchant_customer_support ? @merchant.merchant_customer_support : MerchantCustomerSupport.new()
    @bank_account = @merchant.bank_account ? @merchant.bank_account : BankAccount.new()
  end

  def update
    @is_general = params[:save_general] || params[:save_pic] || params[:save_owner] || params[:save_cs] || params[:save_operational] || params[:save_bank_acc]
    @active = 'tab-pane fade in active'
    @non_active = 'tab-pane fade'
    current_user
    check = true
    @merchant = @current_user.merchant

    @merchant_pic = @merchant.merchant_pic ? @merchant.merchant_pic : MerchantPic.new()
    @merchant_owner = @merchant.merchant_owner ? @merchant.merchant_owner : MerchantOwner.new()
    @merchant_operational = @merchant.merchant_operational ? @merchant.merchant_operational : MerchantOperational.new()
    @merchant_cs = @merchant.merchant_customer_support ? @merchant.merchant_customer_support : MerchantCustomerSupport.new()
    @bank_account = @merchant.bank_account ? @merchant.bank_account : BankAccount.new()

    if params[:save_general]
      @merchant.update(merchant_params)
      check = @merchant.save and check
      render "edit"
    elsif params[:save_pic]
      if @merchant.merchant_pic
        merchant_pic = @merchant.merchant_pic
        merchant_pic.update(merchant_pic_params)
      else
        merchant_pic = MerchantPic.new(merchant_pic_params)
        merchant_pic.merchant = @merchant
      end
        check = merchant_pic.save and check
        @merchant_pic = merchant_pic
        render "edit"
    elsif params[:save_operational]
      if @merchant.merchant_operational
        merchant_operational = @merchant.merchant_operational
        merchant_operational.update(merchant_operational_params)
      else
        merchant_operational = MerchantOperational.new(merchant_operational_params)
        merchant_operational.merchant = @merchant 
      end
        check = merchant_operational.save and check
        @merchant_operational = merchant_operational
        render "edit"
    elsif params[:save_cs]
      merchant_cs = nil
      if @merchant.merchant_customer_support
        merchant_cs = @merchant.merchant_customer_support
        merchant_cs.update(merchant_customer_support_params)
      else
        puts merchant_customer_support_params
        merchant_cs = MerchantCustomerSupport.create(merchant_customer_support_params)
        merchant_cs.merchant = @merchant
      end
        check = merchant_cs.save and check
        @merchant_cs = merchant_cs
        render "edit"
    elsif params[:save_owner]
      if @merchant.merchant_owner
        merchant_owner = @merchant.merchant_owner
        merchant_owner.update(merchant_owner_params)
      else
        merchant_owner = MerchantOwner.new(merchant_owner_params)
        merchant_owner.merchant = @merchant 
      end
        check = merchant_owner.save and check
        @merchant_owner = merchant_owner
        render "edit"
    elsif params[:save_bank_acc]
      if @merchant.bank_account
        merchant_bank_account = @merchant.bank_account
        merchant_bank_account.update(bank_account_params)
      else
        merchant_bank_account = BankAccount.new(bank_account_params)
        merchant_bank_account.merchant = @merchant  
      end
        check = merchant_bank_account.save and check
        @bank_account = merchant_bank_account
        redirect_to controller: 'document', action: 'index'
    else
      redirect_to action: 'edit'
    end
  end
  
  def send_mail
    @text = params[:content]
    @id = params[:merchant_id]
    @merchant = Merchant.find(@id)
    begin
      if MerchantMailer.welcome_email(@merchant, @text).deliver_now
        flash[:notice] = "Mail successfully sent"
        redirect_to sales_list_merchant_url
      else
        flash[:alert] = "Mail failed to send, check your connection and try again"
        redirect_to controller: "agreement", action:"sales_success_create", user_id: @merchant.user.id
      end
    rescue Exception
      flash[:alert] = "Mail failed to send, check your connection and try again"
      redirect_to controller: "agreement", action:"sales_success_create", user_id: @merchant.user.id
    end
  end

  def merchant_params
    params.require(:merchant).permit(:name, :website, :email, :city, :address, :office_status, :type_of_product, :price_range, :time_since_started, :ownership_type, :revenues_each_month, :credit_card_payment_ratio)
  end

  def merchant_customer_support_params
    params.require(:merchant_customer_support).permit(:email, :telephone, :emergency)
  end

  def merchant_operational_params
    params.require(:merchant_operational).permit(:email, :telephone, :emergency)
  end

  def merchant_pic_params
    params.require(:merchant_pic).permit(:email, :name, :address, :telephone)
  end

  def merchant_owner_params
    params.require(:merchant_owner).permit(:email, :name, :address, :telephone)
  end

  def bank_account_params
    params.require(:bank_account).permit(:acc_number, :name, :acc_holder, :acc_type)
  end
end