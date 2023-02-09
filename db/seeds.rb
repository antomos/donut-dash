# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "faker"
Donut.destroy_all
User.destroy_all
Review.destroy_all
puts "starting seed"
FILLING = [ "Chocolate", "Glazed", "Sugar", "Cinnamon", "Maple", "Blueberry", "Strawberry", "Lemon", "Vanilla", "Chocolate", "Pumpkin", "Caramel", "Raspberry", "Peanut Butter", "Coconut", "Banana", "Apple", "Orange", "Lime", "Lemon", "Mango", "Pineapple", "Peach", "Pear", "Raspberry", "Strawberry", "Blueberry", "Blackberry", "Cranberry", "Cherry", "Apricot", "Pomegranate", "Pumpkin", "Cinnamon", "Maple", "Honey", "Vanilla", "Chocolate", "Caramel", "Peanut Butter", "Coconut", "Almond", "Walnut", "Hazelnut", "Pecan", "Cashew", "Macadamia", "Pistachio", "Peanut", "Almond", "Walnut", "Hazelnut", "Pecan", "Cashew", "Macadamia", "Pistachio", "Peanut", "Almond", "Walnut", "Hazelnut", "Pecan", "Cashew", "Macadamia", "Pistachio", "Peanut", "Almond", "Walnut", "Hazelnut", "Pecan", "Cashew", "Macadamia", "Pistachio", "Peanut", "Almond", "Walnut", "Hazelnut", "Pecan", "Cashew", "Macadamia", "Pistachio", "Peanut", "Almond", "Walnut", "Hazelnut", "Pecan", "Cashew", "Macadamia", "Pistachio", "Peanut", "Almond", "Walnut", "Hazelnut", "Pecan", "Cashew", "Macadamia", "Pistachio", "Peanut", "Almond", "Walnut", "Hazelnut", "Pecan", "Cashew", "Macadamia", "Pistachio", "Peanut", "Almond", "Walnut", "Hazelnut", "Pecan", "Cashew", "Macadam"]
5.times do
  user = User.new
  user.email = Faker::Internet.email
  user.username = Faker::Internet.username
  user.password = "123456"
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.address = Faker::Address.full_address
  user.phone_number = Faker::PhoneNumber.cell_phone
  user.baker = [true, false].sample
  user.available = [true, false].sample
  user.save!
  puts "User #{user.id} created"
  3.times do
    donut = Donut.new
    donut.name = Faker::Coffee.blend_name
    donut.description = FILLING.sample
    donut.price = Faker::Number.decimal(l_digits: 1)
    donut.photo.attach(io: URI.open("https://source.unsplash.com/1600x900/?donut"), filename: "donut.jpg", content_type: "image/jpg")
    donut.available = [true, false].sample
    donut.user = user
    donut.save!
    3.times do
      review= Review.create!(comment:Faker::Movie.quote, rating:rand(6) ,donut:donut)
      puts "Review #{review.id} created for donut #{donut.id}"
    end
    puts "Donut #{donut.id} created"
  end
end
puts "seed finished"
