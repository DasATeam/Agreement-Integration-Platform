class MerchantController < ApplicationController
before_action :require_merchant, only: [:edit_general, :edit_pic, :edit_owner, :edit_operational, :edit_customer_support, :edit_bank_account]

  # Handle Request : POST merchant/info/pic and GET merchant/info/pic
  #
  #   For inputting merchant general information
  # == Returns:
  # GET::
  #   Webpage to input information for merchant general
  #
  # POST::
  #   Redirecting to action edit_pic if merchant has not input all the information
  #   
  #   Redirecting to action index at Document if merchant input all the information
  def edit_general
    var
    styling
    @info_completed = @merchant.information_check
    
    if request.post?
      @merchant.update(merchant_params)
      @merchant.save
      if @merchant.check
        if check
          redirect_to(controller: "document", action: "index")
        else
          redirect_to action:"edit_pic"
        end
      else
        flash[:alert] = 'Fill all the field in the form, or check the format of the form';
      end
    end
  end

  # Handle Request : POST merchant/info/owner and GET merchant/info/owner
  #
  #   For inputting merchant pic information
  # == Returns:
  # GET::
  #   Webpage to input information for merchant pic
  #
  # POST::
  #   Redirecting to action edit_owner if merchant has not input all the information
  #   
  #   Redirecting to action index at Document if merchant input all the information
  def edit_pic
    var
    styling
    @info_completed = @merchant.information_check

    if request.post?
      @merchant_pic.assign_attributes(merchant_pic_params)
      @merchant_pic.save
      if @merchant_pic.check
        if check
          redirect_to(controller: "document", action: "index")
        else
          redirect_to action:"edit_owner"
        end
      else
        flash[:alert] = 'Fill all the field in the form, or check the format of the form';
      end
    end
  end

  # Handle Request : POST merchant/info/owner and GET merchant/info/owner
  #
  #   For inputting merchant owner information
  # == Returns:
  # GET::
  #   Webpage to input information for merchant owner
  #
  # POST::
  #   Redirecting to action edit_customer_support if merchant has not input all the information
  #   
  #   Redirecting to action index at Document if merchant input all the information
  def edit_owner
    var
    styling
    @info_completed = @merchant.information_check

    if request.post?
      @merchant_owner.assign_attributes(merchant_owner_params)
      @merchant_owner.save
      if @merchant_owner.check
        if check
          redirect_to(controller: "document", action: "index")
        else
          redirect_to action:"edit_customer_support"
        end
      else
        flash[:alert] = 'Fill all the field in the form, or check the format of the form';
      end
    end
  end

  # Handle Request : POST merchant/info/cs and GET merchant/info/cs
  #
  #   For inputting merchant customer support information
  # == Returns:
  # GET::
  #   Webpage to input information for merchant customer support
  #
  # POST::
  #   Redirecting to action edit_operational if merchant has not input all the information
  #   
  #   Redirecting to action index at Document if merchant input all the information
  def edit_customer_support
    var
    styling
    @info_completed = @merchant.information_check

    if request.post?
      @merchant_cs.assign_attributes(merchant_customer_support_params)
      @merchant_cs.save
      if @merchant_cs.check
        if check
          redirect_to(controller: "document", action: "index")
        else
          redirect_to action:"edit_operational"
        end
      else
        flash[:alert] = 'Fill all the field in the form, or check the format of the form';
      end
    end
  end

  # Handle Request : POST merchant/info/operational and GET merchant/info/operational
  #
  #   For inputting merchant operational information
  # == Returns:
  # GET::
  #   Webpage to input information for merchant operational
  #
  # POST::
  #   Redirecting to action edit_bank_account if merchant has not input all the information
  #   
  #   Redirecting to action index at Document if merchant input all the information
  def edit_operational
    var
    styling
    @info_completed = @merchant.information_check

    if request.post?
      @merchant_operational.assign_attributes(merchant_operational_params)
      @merchant_operational.save
      if @merchant_operational.check
        if check
          redirect_to(controller: "document", action: "index")
        else
          redirect_to action:"edit_bank_account"
        end
      else
        flash[:alert] = 'Fill all the field in the form, or check the format of the form';
      end
    end
  end

  # Handle Request : POST merchant/info/bank and GET merchant/info/bank
  #
  #   For inputting merchant bank account information
  # == Returns:
  # GET::
  #   Webpage to input information for merchant bank account
  #
  # POST::
  #   Redirecting to action edit_general if merchant has not input all the information
  #   
  #   Redirecting to action index at Document if merchant input all the information
  def edit_bank_account
    var
    styling
    @info_completed = @merchant.information_check

    if request.post?
      @bank_account.assign_attributes(bank_account_params)
      @bank_account.save
      if @bank_account.valid?
        if check
          redirect_to(controller: "document", action: "index")
        else
          redirect_to action: 'edit_general'
        end
      else
        flash[:alert] = 'Fill all the field in the form, or check the format of the form';
      end
    end
  end

  # Handle Request : POST merchant/send-mail/:merchant_id
  #
  #   For sending email from sales to merchant
  # == Returns:
  # POST::
  #   Delivering email to merchant with inputted content text
  #   Redirecting to sales/list_merchant if succeed
  #   Redirecting to action sales_success_create at Agreement if failed sending mail or catch exception
  def send_mail
    @text = params[:content]
    @id = params[:merchant_id]
    @merchant = Merchant.find(@id)
    begin
      if MerchantMailer.welcome_email(@merchant, @text).deliver_now
        flash[:notice] = "Mail successfully sent to " + @merchant.name
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

  # Handle Request : GET merchant/finish
  #
  #   For giving information to merchant what to do next after finished all steps
  # == Returns:
  # GET::
  #   Webpage to show information for merchant when finished all steps
  def finish

  end

  private def check
    return @merchant.valid? && @merchant_operational.valid? && @merchant_cs.valid? && @merchant_owner.valid? && @merchant_pic.valid? && @bank_account.valid?
  end

  private def styling
    @green = 'color : green;'
  end

  private def var
    @merchant = current_user.merchant
    @bank_account = @merchant.bank_account ? @merchant.bank_account : BankAccount.new(merchant: @merchant)
    @merchant_operational = @merchant.merchant_operational ? @merchant.merchant_operational : MerchantOperational.new(merchant: @merchant, is_completed: false)
    @merchant_cs = @merchant.merchant_customer_support ? @merchant.merchant_customer_support : MerchantCustomerSupport.new(merchant: @merchant, is_completed: false)
    @merchant_owner = @merchant.merchant_owner ? @merchant.merchant_owner : MerchantOwner.new(merchant: @merchant, is_completed: false)
    @merchant_pic = @merchant.merchant_pic ? @merchant.merchant_pic : MerchantPic.new(merchant: @merchant, is_completed: false)
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