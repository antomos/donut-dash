class DonutTag < ApplicationRecord
  belongs_to :donut
  belongs_to :tag

  validates :tag, uniqueness: { scope: :donut, message: "Already added" }
end
