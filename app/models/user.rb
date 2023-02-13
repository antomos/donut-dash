class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :orders
  has_many :donuts
  # has_many :orders, through: :donuts
  # has_many :orders, through: :dounts # don't need
  # has_many :reviews, though: :donuts, through: :orders # don't need
end
