class OrdersController < ApplicationController
  before_action :set_order, only: [:show]
  def index
    @orders = Order.all
  end

  def show
    @donut = @order.donut
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:donut_id)
  end
end
