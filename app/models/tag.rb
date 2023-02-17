class Tag < ApplicationRecord
  has_many :donut_tags, dependent: :destroy
  has_many :donuts, through: :donut_tags

  validates :name, uniqueness: true
end
