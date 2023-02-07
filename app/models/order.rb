class Order < ApplicationRecord
  belongs_to :donut
  belongs_to :user
end
