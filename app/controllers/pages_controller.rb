class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @top_donuts = Donut.order(rating: :desc).limit(3)
  end

  def account
  end

  def bakery
    @complete_orders = []
    @pending_orders = []
    @accepted_orders = []

    current_user.donuts.each do |donut|
      donut.orders.each do |order|
        if order.complete
          @complete_orders << order
        else
          @pending_orders << order if order.status == "pending"
          @accepted_orders << order if order.status == "accepted"
        end
      end
    end
  end
end
