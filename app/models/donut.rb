class Donut < ApplicationRecord
  # belongs_to :user
  has_many :reviews
  has_one_attached :photo
end
