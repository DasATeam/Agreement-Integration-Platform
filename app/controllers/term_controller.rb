class TermController < ApplicationController
  before_action :require_merchant, only: [:index, :doc, :agree]
  before_action :require_sales, only: [:sales_download]

  def index
    @term = Point.first
    @merchant = current_user.merchant
    @agreement = @merchant.agreements.first

    @has_agreed = @agreement.has_agree
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

  def sales_download
    card_channel_id = [1, 2, 3, 4, 5, 6, 11]

    @agreement = Agreement.find(params[:agreement_id])
    @merchant = @agreement.merchant
    @user = @merchant.user
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
    @agreement.has_agree = true
    @agreement.save

    redirect_to action: "index"
  end
end
