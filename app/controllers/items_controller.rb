class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  

  def index
  end

  def new
      @item = Item.new   
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end 
  end

  private

  def item_params
    params.require(:item).permit(
      :item_name,
      :description,
      :category_id,
      :condition_id,
      :postage_id,
      :delivery_area_id,
      :delivery_period_id,
      :price,
      :image
    ).merge(user_id: current_user.id)
  end

end
