class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @top_donuts = Donut.order(rating: :desc).limit(3)
  end

  def account
  end

  def bakery
  end
end
