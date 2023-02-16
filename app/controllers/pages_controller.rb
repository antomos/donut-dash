class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @top_donuts = Donut.order(rating: :desc).limit(3)
  end

  def account
    sort_user_orders
  end

  def bakery
    sort_bakery_orders
  end

  def archived
    sort_bakery_orders
  end

  private

  def sort_bakery_orders
    @complete_orders = []
    @delivery_orders = []
    @pending_orders = []
    @accepted_orders = []
    @archived_orders = []

    current_user.donuts.each do |donut|
      donut.orders.each do |order|
        if order.archived
          @archived_orders << order
        elsif order.complete
          @complete_orders << order
        else
          @pending_orders << order if order.status == "Pending"
          @accepted_orders << order if order.status == "Accepted"
          @delivery_orders << order if order.status == "Out for Delivery"
        end
      end
    end
  end

  def sort_user_orders
    @complete_orders = []
    @delivery_orders = []
    @pending_orders = []
    @accepted_orders = []
    @archived_orders = []

    current_user.orders.each do |order|
      if order.archived
        @archived_orders << order
      elsif order.complete
        @complete_orders << order
      else
        @pending_orders << order if order.status == "Pending"
        @accepted_orders << order if order.status == "Accepted"
        @delivery_orders << order if order.status == "Out for Delivery"
      end
    end
  end
end
