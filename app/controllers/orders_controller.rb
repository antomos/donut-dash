class OrdersController < ApplicationController
  before_action :set_order, only: [:show]
  before_action :set_donut, only: [:new, :create]

  def show
    @donut = Donut.find(@order.donut_id)
  end

  def new
    @order = Order.new
    # @donut = Donut.new
    @order.user_id = current_user.id
    # @order.donut_id = donut.id
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.donut = @donut
    @order.total_cost = @order.quantity * @donut.price
    @order.status = "pending" # add to model as deafault with migration
    if @order.save
      redirect_to order_path(@order)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_donut
    @donut = Donut.find(params[:donut_id])
  end

  def order_params
    params.require(:order).permit(:quantity, :requested_date, :requested_time)
  end
end
