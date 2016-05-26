class MerchantController < ApplicationController
before_action :require_merchant, only: [:edit, :update]

  def edit_general
    user = current_user
    @merchant = user.merchant
    
    if request.post?
      @merchant.update(merchant_params)
      @merchant.save
      if @merchant.valid?
        redirect_to action:"edit_pic"
      else
        flash[:alert] = 'Fill all the field in the form';
      end
    end
  end

  def edit_pic
    @merchant = current_user.merchant
    @merchant_pic = @merchant.merchant_pic ? @merchant.merchant_pic : MerchantPic.new(merchant: @merchant)

    if request.post?
      @merchant_pic.assign_attributes(merchant_pic_params)
      @merchant_pic.save
      if @merchant_pic.valid?
        redirect_to action:"edit_owner"
      else
        flash[:alert] = 'Fill all the field in the form';
      end
    end
  end

  def edit_owner
    @merchant = current_user.merchant
    @merchant_owner = @merchant.merchant_owner ? @merchant.merchant_owner : MerchantOwner.new(merchant: @merchant)

    if request.post?
      @merchant_owner.assign_attributes(merchant_owner_params)
      @merchant_owner.save
      if @merchant_owner.valid?
        redirect_to action:"edit_customer_support"
      else
        flash[:alert] = 'Fill all the field in the form';
      end
    end
  end

  def edit_customer_support
    @merchant = current_user.merchant
    @merchant_cs = @merchant.merchant_customer_support ? @merchant.merchant_customer_support : MerchantCustomerSupport.new(merchant: @merchant)
    
    if request.post?
      @merchant_cs.assign_attributes(merchant_customer_support_params)
      @merchant_cs.save
      if @merchant_cs.valid?
        redirect_to action:"edit_operational"
      else
        flash[:alert] = 'Fill all the field in the form';
      end
    end
  end

  def edit_operational
    @merchant = current_user.merchant
    @merchant_operational = @merchant.merchant_operational ? @merchant.merchant_operational : MerchantOperational.new(merchant: @merchant)

    if request.post?
      @merchant_operational.assign_attributes(merchant_operational_params)
      @merchant_operational.save
      if @merchant_operational.valid?
        redirect_to action:"edit_bank_account"
      else
        flash[:alert] = 'Fill all the field in the form';
      end
    end
  end

  def edit_bank_account
    @merchant = current_user.merchant
    @bank_account = @merchant.bank_account ? @merchant.bank_account : BankAccount.new(merchant: @merchant)
    
    if request.post?
      @bank_account.assign_attributes(bank_account_params)
      @bank_account.save
      if @bank_account.valid?
        redirect_to controller: 'document', action: 'index'
      else
        flash[:alert] = 'Fill all the field in the form';
      end
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