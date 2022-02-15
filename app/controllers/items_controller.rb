class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private

  def item_params
    params.requier(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, :price)
  end
end
