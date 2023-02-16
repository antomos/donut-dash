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
DONUT = [
  ["Chocolitious", "Chocolate donut with chocolate glaze and chocolate sprinkles","https://res.cloudinary.com/danwlbu2c/image/upload/v1676124711/production/e4ymfl2c6kfr8inpu8drqeb9nksz.jpg"],
["Mr Pinky", "Pink donut with pink glaze and pink sprinkles","https://res.cloudinary.com/danwlbu2c/image/upload/v1676314547/production/rremdeoazzmlmudnhmpznnjhfslt.jpg"],
["White Caramel", "White donut with caramel glaze","https://res.cloudinary.com/danwlbu2c/image/upload/v1676314531/production/4n11sjyn6dq0709wgcq5bjoo0s2k.jpg"],
["Coffee ", "Coffee donut with coffee glaze","https://res.cloudinary.com/danwlbu2c/image/upload/v1676131989/production/x0hjapfbxe1kcr3gpxkdrquhfdz5.jpg"],
["Rainbow", "Donut with white gazing and rainbow sprinkles","https://res.cloudinary.com/danwlbu2c/image/upload/v1676116025/production/pprg19mhcwcjiqtdc6vsomw393y9.jpg"]
]

REVIEWS = [
  "I recently had a donut from this shop and it was the worst experience ever. The donut was stale, overly sweet, and lacked in flavor. The staff was unhelpful and uninterested in my needs. I would never recommend this place to anyone. Stay away!!",
  "My wife and I really love donuts, and we can't go to the donut shop without buying some. But when we went to a nearby donut shop, it was frustrating because the donuts weren't fresh. We were left with a choice: eat donuts that weren't fresh, or eat donuts that were fresh but not as good. We decided to give this new product a try, and we're glad we did!
  This product is great. We've been using",
  "The donut I had was average. It had a nice flavor, but the texture was a bit dry and lacked moisture. Overall, it wasn't bad, but it wasn't anything special either.",

  "This donut was great! It had a light and fluffy texture, and the glaze was sweet and delicious. There was a nice variety of toppings to choose from, and they all tasted fresh. The donut seemed to be freshly made and was a great treat. Highly recommend!",

  "I am so in love with this product. I am not a big dessert person, but these donuts are pretty awesome! The best part is that they are gluten-free, which is great for us. I have tried a few different flavors and they really are delicious! I am so happy to have found this site because I had been looking for a great gluten-free donut recipe. I would definitely recommend these to anyone."

]
ADDRESSES = ["61 Oxford St, London W1D 2EH, UK","7 Northumberland Ave, London WC2N 5BY","1 Piccadilly Circus, London W1J 0DA","Marylebone Rd, London NW1 5LR","83 Bell St, London NW1 6TB"]
for i in 0..4 do
  user = User.new
  user.email = "baker#{i}@baker.com"
  user.username = Faker::Internet.username
  user.password = "123456"
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.address = ADDRESSES[i]
  user.phone_number = Faker::PhoneNumber.cell_phone
  user.baker = true
  user.available = true
  user.save!
  puts "Baker #{i} created"
  if user.baker == true
      3.times do
        donut = Donut.new
        rand_num= rand(0..4)
        donut.name = DONUT[rand_num][0]
        donut.description = DONUT[rand_num][1]
        donut.price = Faker::Number.decimal(l_digits: 1)
        donut.photo.attach(io: URI.open(DONUT[rand_num][2]), filename: "donut.jpg", content_type: "image/jpg")
        donut.available = [true, false].sample
        donut.user = user
        donut.save!
        3.times do
          rand_num = rand(1..5)
          review= Review.create!(comment:REVIEWS[rand_num-1], rating: rand_num ,donut:donut, user:user)
          puts "Review #{review.id} created for donut #{donut.id}"
          donut.rating = Review.where(donut: donut).average(:rating).round(1)
          donut.number_ratings = Review.where(donut: donut).count
          donut.save!
        end
        puts "Donut #{donut.id} created"
      end
  end
end
for i in 0..4 do
  user = User.new
  user.email = "buyer#{i}@buyer.com"
  user.username = Faker::Internet.username
  user.password = "123456"
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.address = ADDRESSES[i]
  user.phone_number = Faker::PhoneNumber.cell_phone
  user.baker = false
  user.available = false
  user.save!
  puts "Buyer #{i} created"
end
for i in 1..15 do
  # Order.create!(user: User.all.sample, donut: Donut.all.sample, quantity: rand(1..5), status: ["pending", "accepted", "rejected", "delivered"].sample)
  order = Order.new
  order.user_id = rand(5..10)
  donut = Donut.find(i)
  order.donut = donut
  order.quantity = rand(1..5)
  order.total_cost = (order.quantity * donut.price).round(2)
  puts "Order #{i} : #{donut.price} * #{order.quantity} = #{order.total_cost}"
  order.requested_date = Faker::Date.between(from: 2.days.ago, to: Date.today)
  order.requested_time = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  order.status = ["pending", "accepted", "rejected", "delivered"].sample
  if order.status == "delivered"
    order.complete = true
  end
  order.save!

  puts "Order #{i} created"
end
puts "seed finished"
