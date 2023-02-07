# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "faker"

20.times do
  donut = Donut.new
  donut.name = Faker::Artist.name
  donut.description = Faker::Coffee.notes
  donut.price = Faker::Number.decimal(l_digits: 1)
  donut.available = true
  donut.save!
end
