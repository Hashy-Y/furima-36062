class BuyRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new
  end

  def new
    
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_record_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_record_params
    params.require(:buy_address).permit(
    :postal_code,
    :delivery_area_id,
    :city,
    :address_line,
    :building_name,
    :phone_number)
    .merge(user_id: current_user.id, item_id: @item.id)
  end
end
