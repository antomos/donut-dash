class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update]
  before_action :set_donut, only: [:new, :create, :update]

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
    if @order.quantity
      @order.total_cost = (@order.quantity * @donut.price).round(2)
    end
    @order.status = "Pending" # add to model as deafault with migration
    @order.complete = false
    @order.archived = false
    if @order.save
      redirect_to order_path(@order)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @order.update(order_params)
    redirect_to bakery_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_donut
    @donut = Donut.find(params[:donut_id])
  end

  def order_params
    params.require(:order).permit(:quantity, :requested_date, :requested_time, :status, :complete, :archived)
  end
end
