class TermController < ApplicationController
  before_action :require_merchant

  def index
    # TODO: Should check first if merchant already fill the form
    @term = Point.first

    render "index"
  end

  def doc
    card_channel_id = [1, 2, 3, 4, 5, 6, 11]

    @user = current_user
    @merchant = @user.merchant
    @agreement = @merchant.agreements.first
    @term = Point.first

    @selected_channels = Array.new(20, false)
    @agreement.agreement_channels.each do |agreement_channel|
      @selected_channels[agreement_channel.channel_type.id] = true 
    end

    @cards_channel = false
    card_channel_id.each do |val|
      if ! @selected_channels[val]
        @cards_channel = true
        break
      end
    end

    respond_to do |format|
      format.html do
        render pdf: "Agreement",
        disposition: "inline",
        template: "term/doc.html.erb",
        page_size: "A4",
        margin: {top: 20, left: 20, bottom: 20, right: 20}
      end
    end
  end

  def agree
    @merchant = current_user.merchant
    @agreement = @merchant.agreements.first
    @agreement.has_agree = true
    @agreement.save

    redirect_to controller: "user", action: "merchant_new", hash: @merchant.registration_link, success: "has agreed"
  end
end
