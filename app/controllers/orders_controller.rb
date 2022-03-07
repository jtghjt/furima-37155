class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_data_read, only: [:index, :create]
  
  def index
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:postcode, :prefecture_id, :municipalities, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_data_read
    @item = Item.find(params[:item_id])
  end
end
