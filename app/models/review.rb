class Review < ApplicationRecord
  belongs_to :donut
  belongs_to :user
end
