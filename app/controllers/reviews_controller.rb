class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @donut = Donut.find(params[:donut_id])
  end

  def create
    @donut = Donut.find(params[:donut_id])
    # @review = @donut.reviews.new(review_params)
    @review = Review.new(review_params)
    @review.user = current_user
    @review.donut = @donut
    if @review.save
      redirect_to @donut, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

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
