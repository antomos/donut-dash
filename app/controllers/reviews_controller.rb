class ReviewsController < ApplicationController
  before_action :set_donut # , only: [:new, :create]

  def index
    @reviews = @donut.reviews
  end

  def show
    @review = @donut.reviews.find(params[:id])
  end

  def new
    @review = @donut.reviews.new
  end

  def create
    @review = @donut.reviews.new(review_params)
    if @review.save
      redirect_to @donut, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def set_donut
    @donut = Donut.find(params[:donut_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end

##### DECA: COMMENTED OUT CAUSE I CAN'T REMEMBER WHAT THIS IS: #####
# # Path: app/models/review.rb
# class Review < ActiveRecord::Base
#   belongs_to :product
#   belongs_to :user
#   validates :product_id, presence: true
#   validates :user_id, presence: true
#   validates :description, presence: true
#   validates :rating, presence: true
# end

# # Path: app/models/user.rb
# class User < ActiveRecord::Base
#   has_many :reviews
#   has_many :products, through: :reviews
#   has_secure_password
#   validates :email, presence: true, uniqueness: true
# end
