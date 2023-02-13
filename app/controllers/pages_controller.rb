class PagesController < ApplicationController
  def home
    @top_donuts = Donut.order(rating: :desc).limit(3)
  end

  def account
  end

  def bakery
  end
end
