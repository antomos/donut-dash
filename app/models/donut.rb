class Donut < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :orders
  has_one_attached :photo
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
                  against: [ :name, :description ],
                  associated_against: { user: [ :username, :first_name, :last_name, :address ] },
                  using: { tsearch: { prefix: true } }
end
