class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @top_donuts = Donut.order(rating: :desc).limit(3)
  end

  def account
    sort_orders
  end

  def bakery
    sort_orders
  end

  private

  def sort_orders
    @complete_orders = []
    @delivery_orders = []
    @pending_orders = []
    @accepted_orders = []

    current_user.donuts.each do |donut|
      donut.orders.each do |order|
        if order.complete
          @complete_orders << order
        else
          @pending_orders << order if order.status == "Pending"
          @accepted_orders << order if order.status == "Accepted"
          @delivery_orders << order if order.status == "Out for Delivery"
        end
      end
    end
  end
end
