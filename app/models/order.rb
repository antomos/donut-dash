class Order < ApplicationRecord
  belongs_to :donut
  belongs_to :user
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
