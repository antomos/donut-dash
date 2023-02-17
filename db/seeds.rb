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
  ["Rainbow", "Donut with pink gazing and rainbow sprinkles","https://res.cloudinary.com/danwlbu2c/image/upload/v1676116025/production/pprg19mhcwcjiqtdc6vsomw393y9.jpg"],
  ["Pride", "Donut and rainbow sprinkles","https://res.cloudinary.com/danwlbu2c/image/upload/v1675792698/towfiqu-barbhuiya-X8AfWPcVSAc-unsplash_hb1gqf.jpg"],
  ["Mint Chocolate", "Donut with mint chocolate glaze and sprinkles","https://res.cloudinary.com/danwlbu2c/image/upload/v1676124725/production/u0idwwbvn43lx781or4krdr0povf.jpg"],
  ["Salted Caramel", "Donut with salted caramel and chocolate glaze","https://res.cloudinary.com/danwlbu2c/image/upload/v1676116032/production/o2qp9ei30dq0ev3wt8ma79vme9hh.jpg"],
  ["Jam", "Donut with raspberry jam","https://www.premierfrozenfoods.com/custom/public/images/jam-doughnut.jpg"],
  ["Rose", "Donut with rose jam and icing","https://static.wixstatic.com/media/ca6fd1_82d324e61372408a901b1b32dffe0285~mv2.jpg/v1/fill/w_1960,h_1102,al_c,q_85,usm_0.66_1.00_0.01/ca6fd1_82d324e61372408a901b1b32dffe0285~mv2.webp"],
  ["Donut's Blues", "Donut with blue icing and sprinkles","https://d2j6dbq0eux0bg.cloudfront.net/images/14368473/1473758531.jpg"],
  ["Dark Chocolate", "Donut with dark chocolate glaze","https://images.unsplash.com/photo-1530016910220-faf7fab2125c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=920&q=80"],
  ["Cinnamon", "Donut with cinnamon sugar","https://cardamomandtea.com/wp-content/uploads/2021/06/IMG_2024-min.jpg"],
  ["Original Glazed", "Original glazed donut","https://i2-prod.mirror.co.uk/incoming/article21080689.ece/ALTERNATES/s615b/0_Krispy-Kreme-Original-Glazed-doughnut.jpg"],
  ["Jam and Custard", "Donut with raspberry jam and custard","https://img.taste.com.au/200L2azn/w720-h480-cfill-q80/taste/2021/03/cheatys-jam-custard-doughnuts-170404-1.jpg"]
]

REVIEWS = [
  ["I had a donut from this shop and it was the worst experience ever. The donut was stale, overly sweet, and lacked in flavor. The staff was unhelpful and uninterested in my needs. I would never recommend this place to anyone. Stay away!!","I tried one. It definitely tastes like it’s expired. It tastes horrible.","Whoa the amount of sugar in these are crazy. Also the donut doesn't taste like it's cooked all the way. I wouldn't recommend if you're diabetic obviously but all in all I wouldn't recommend at all. Thumbs down.Yuck","For me the glaze tasted like wax left a weird waxy plastic in my mouth. I ended up throwing away. :(","Disgusting! Leaves a nasty chemical tasting coating in your mouth. Could even get my 6 yr olds to eat them"],
  ["My wife and I really love donuts, and we can't go to the donut shop without buying some. But when we went to a nearby donut shop, it was frustrating because the donuts weren't fresh. We were left with a choice: eat donuts that weren't fresh, or eat donuts that were fresh but not as good. We decided to give this new product a try, and we're glad we did!
  This product is great. We've been using", "Way overpriced","from seeing the box they arrived in, I knew there would be an issue. no packing was used to protect them expect for the flimsy plastic wrapping and thin cardboard used underneath every 2 donuts , probably used to sell them by two on shelves in stores. I did not complain to the seller since part of the issue was the mailing system. as for the donuts taste, they are very good despite being smashed and I do mean smashed. even though they were very moist and flavor-able, I probably won't reorder due to the poor presentation of them being so smashed. I know they would not have been able to be sold in stores looking the way they did when they arrived.","I did not like the consistency of the doughnut. They need to be more moist and softer."],
  ["The donut I had was average. It had a nice flavor, but the texture was a bit dry and lacked moisture. Overall, it wasn't bad, but it wasn't anything special either.","t's hit or miss when ordering these. They are my favorite and I always look for the best deal BUT many times the box shown and/or the description says JUMBO donuts and when I get them they are tiny. VERY DECEPTIVE IN ORDER TO GET A SALE!!!","Not so fresh but tasted ok.","What more to say, but great tasting, yet overpriced. They arrived soft and moist. No issues with packaging.","Nice treat!"],
  ["This donut was great! It had a light and fluffy texture, and the glaze was sweet and delicious. There was a nice variety of toppings to choose from, and they all tasted fresh. The donut seemed to be freshly made and was a great treat. Highly recommend!","They were so good and loved that they were all individually wrapped. ","Warmed these for few seconds in the microwave and they were delicious. However, the cost will prevent me from buying them very often","I didn’t take a photo, but you should have seen my brother-in-law waiting for me to open the box. He loves to donuts and so did the rest of the family.","I was positively surprised! I will buy them again"],
  ["I am so in love with this product. I am not a big dessert person, but these donuts are pretty awesome! The best part is that they are gluten-free, which is great for us. I have tried a few different flavors and they really are delicious! I am so happy to have found this site because I had been looking for a great gluten-free donut recipe. I would definitely recommend these to anyone.","We love these donuts and couldn't find them at any grocery store. They were delivered in perfect condition and they were fresh and delicious","Soft,sweet and with a delicious scent. Very expensive but for a special occasion they are wonderful ","That was one of the best donuts I have ever had! The owner of the bakery was very friendly and the the delivery was super fast","Loved it! I am glad I found donut-dash! I will definitely order again!"]
]

BAKERS = [
  ["Baker1", "https://res.cloudinary.com/danwlbu2c/image/upload/v1676124711/production/e4ymfl2c6kfr8inpu8drqeb9nksz.jpg"],
  ["Baker2", "https://res.cloudinary.com/danwlbu2c/image/upload/v1676314547/production/rremdeoazzmlmudnhmpznnjhfslt.jpg"],
  ["Baker3", "https://res.cloudinary.com/danwlbu2c/image/upload/v1676314531/production/4n11sjyn6dq0709wgcq5bjoo0s2k.jpg"],
  ["Baker4", "https://res.cloudinary.com/danwlbu2c/image/upload/v1676131989/production/x0hjapfbxe1kcr3gpxkdrquhfdz5.jpg"],
  ["Baker5", "https://res.cloudinary.com/danwlbu2c/image/upload/v1676116025/production/pprg19mhcwcjiqtdc6vsomw393y9.jpg"]
]
ADDRESSES = ["61 Oxford St, London W1D 2EH, UK","7 Northumberland Ave, London WC2N 5BY","1 Piccadilly Circus, London W1J 0DA","Marylebone Rd, London NW1 5LR","83 Bell St, London NW1 6TB"]

Tag.create!(name: "gluten free")
Tag.create!(name: "vegetarian")
Tag.create!(name: "vegan")
Tag.create!(name: "low fat")

donut_index = 0
for i in 0..4 do
  user = User.new
  user.email = "baker#{i}@baker.com"
  user.username = Faker::Internet.username
  user.password = "123456"
  user.first_name = Faker::Company.name
  user.last_name = "N/A"
  user.address = ADDRESSES[i]
  user.phone_number = Faker::PhoneNumber.cell_phone
  user.baker = true
  user.available = true
  user.save!
  puts "Baker #{i} created"
  if user.baker == true
      3.times do
        donut = Donut.new
        donut.name = DONUT[donut_index][0]
        donut.description = DONUT[donut_index][1]
        donut.price = 0.50*rand(1..10).round(2)
        donut.photo.attach(io: URI.open(DONUT[donut_index][2]), filename: "donut.jpg", content_type: "image/jpg")
        donut.available = [true, false].sample
        donut.user = user
        donut.save!
        DonutTag.create(donut: donut, tag: Tag.all.sample)
        DonutTag.create(donut: donut, tag: Tag.all.sample)
        donut_index += 1
        puts "Donut #{donut.id} created"
      end
  end
end
for i in 0..9 do
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
  order = Order.new
  order.user_id = rand(5..15)
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
  4.times do
    rand_num = rand(1..5)
    review= Review.create!(comment:REVIEWS[rand_num-1].sample, rating: rand_num ,donut:donut, user_id:rand(5..15))
    puts "Review #{review.id} created for donut #{donut.id}"
    donut.rating = Review.where(donut: donut).average(:rating).round(1)
    donut.number_ratings = Review.where(donut: donut).count
    donut.save!
  end
  puts "Order #{i} created"
end

puts "seed finished"
