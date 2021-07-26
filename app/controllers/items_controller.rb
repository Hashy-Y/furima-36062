class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :edit]
  before_action :set_prototype, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.order(created_at: :desc)
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

  def show
    #@item = Item.find(params[:id])
  end

  def edit
    #@item = Item.find(params[:id])
  end

  def update
    #@item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render action: :edit
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

  def set_prototype
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @item.user.id
      redirect_to action: :index
    end
  end
end
