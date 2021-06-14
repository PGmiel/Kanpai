# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Order.destroy_all
Review.destroy_all
MenuItem.destroy_all
Booking.destroy_all
Menu.destroy_all
Booking.destroy_all
Table.destroy_all
Restaurant.destroy_all
User.destroy_all

users = []
puts "creating Users"
user_1 = User.create!(
  first_name: 'Johnny',
  last_name: 'Bravo',
  email: 'johnny.bravo@cn.com',
  password: "123123",
  status_owner: 'owner'
  )
 users << user_1

user_2 = User.create!(
  first_name: 'Eric',
  last_name: 'Ramzy',
  email: 'eric@cn.com',
  password: "123123",
  status_owner: 'owner'
  )
  users << user_2

user_3 = User.create!(
  first_name: 'Test',
  last_name: 'Test',
  email: 'testtest@cn.com',
  password: "123123",
  )
  users << user_3

puts "Creating a Restaurant"
restaurant  = Restaurant.create!(
  name: 'Plein Publiek',
  address: 'Mont des Arts, 1000 Bruxelles',
  website: 'https://pleinpubliek.be/',
  phone_number: '0485 97 72 05',
  photo_url: 'https://scontent-bru2-1.xx.fbcdn.net/v/t1.6435-9/166432341_761718487861378_516644447655069420_n.jpg?_nc_cat=105&ccb=1-3&_nc_sid=6e5ad9&_nc_ohc=dAzQVyxNkDEAX9JRq0e&_nc_ht=scontent-bru2-1.xx&oh=2bd2a5ec3ae24a9fcd46bc72837733d3&oe=60C86256',
  user: users.sample
  )

restaurant  = Restaurant.create!(
  name: 'Colonel',
  address: 'Rue Jean Stas 24, 1060 Saint-Gilles',
  website: 'https://pleinpubliek.be/',
  phone_number: '0485 97 72 05',
  photo_url: 'https://cdn.shopify.com/s/files/1/0257/8389/4067/files/DSC_4605_copie_1728x.jpg?v=1607093350',
  user: users.sample
  )

restaurant  = Restaurant.create!(
  name: 'Nona',
  address: 'Rue Sainte-Catherine 17-19, 1000 Brussels',
  website: 'https://www.nonalife.com/',
  phone_number: '0485 97 72 05',
  photo_url: 'https://lp-cms-production.imgix.net/2019-06/ecf1567a8e869dce9ef8ea789034177e-lpl-nona-1.jpg?auto=compress&crop=center&fit=crop&format=auto&h=832&w=1920',
  user: users.sample
  )

restaurant  = Restaurant.create!(
  name: 'Brasserie de la Ville',
  address: 'Hoedenmakerstraat 14, 1000 Bruxelles',
  website: 'https://www.brasseriedelaville.be/en/',
  phone_number: '02 513 68 88',
  photo_url: 'https://www.brasseriedelaville.be/i/brasserie-de-la-ville-304868/3/4/5/9/5/1/1/4/1/3/8/1457347171_229/15f2923bcf91691615a067d3fe8e8f63.jpg',
  user: users.sample
  )

restaurant  = Restaurant.create!(
  name: 'Mer du Nord',
  address: 'Sint-Katelijnestraat 45, 1000 Bruxelles',
  website: 'https://vishandelnoordzee.be/',
  phone_number: '02 513 11 92',
  photo_url: 'https://s3-media0.fl.yelpcdn.com/bphoto/nHoNHepYebC2ai4Lhzq0Ew/o.jpg',
  user: users.sample
  )


restaurant  = Restaurant.create!(
  name: 'Comptoir Rodin',
  address: 'Avenue Auguste Rodin 8, 1050 Ixelles',
  website: 'http://comptoir-rodin.be/',
  phone_number: '02 203 00 14',
  photo_url: 'https://lp-cms-production.imgix.net/2019-06/c5ad61c161a1848c663791328abae350-lpl-comptoir_rodin-1.jpg?auto=compress&crop=center&fit=crop&format=auto&h=832&w=1920',
  user: users.sample
  )


restaurant  = Restaurant.create!(
  name: 'Palo Alto',
  address: '35 Rue Tasson-Snel, 1060 Saint-Gilles',
  website: 'https://www.paloaltoginfood.be/',
  phone_number: '0485 97 72 05',
  photo_url: 'https://lp-cms-production.imgix.net/2019-06/8a1512e5c8a631f6d8b133def4bdcb64-lpl-palo_alto-1.jpg?auto=compress&crop=center&fit=crop&format=auto&h=832&w=1920',
  user: users.sample
  )


restaurant  = Restaurant.create!(
  name: 'Big Mama',
  address: 'Oud Korenhuis 41, 1000 Bruxelles',
  website: 'https://bigmama.be/',
  phone_number: '02 513 36 59',
  photo_url: 'https://s3-media0.fl.yelpcdn.com/bphoto/tuAYds0YF1TGDbAxeE-Kng/o.jpg',
  user: users.sample
  )


restaurant  = Restaurant.create!(
  name: 'Hortense & Humus',
  address: 'Rue de Vergnies 2, 1000 Bruxelles',
  website: 'https://pleinpubliek.be/',
  phone_number: '0479 54 44 87',
  photo_url: 'https://lp-cms-production.imgix.net/2019-06/2683622f9fc73887ceafb413a3e2d992-hortense-humus.jpg?auto=compress&crop=center&fit=crop&format=auto&h=832&w=1920',
  user: users.sample
  )

15.times do
  puts "Creating a Restaurant"
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    # address:  Faker::Config.locale=(nl_BE).address,
    # latitude: rand(50..51),
    # longitude: rand(4..5),
    user: user,
  )
restaurants = Restaurant.all
restaurants.each do |restaurant |
  puts "Creating Tables"
  rand(5..10).times do |n|
    table = Table.create!(
      number_of_table: n + 1,
      capacity: rand(1..12),
      status: "available",
      restaurant: restaurant
      )
  end

  puts "Creating Reviews"
  10.times do
    review = Review.create!(
      content: Faker::Quote.yoda,
      rating: [3, 4, 5].sample,
      user: users.sample,
      restaurant: restaurants.sample
    )
  end

  puts "Creating 1 Menu"
  menu = Menu.create!(
    restaurant: restaurant
    )

  puts "Creating Menu Items"
  10.times do
    menu_items = MenuItem.create!(
      item_name: [Faker::Food.dish, Faker::Dessert.variety, Faker::Beer.name].sample ,
      category: ["Hot Drinks", "Dessert", "Beers", "Wine", "Main Dishes", "Starter"].sample,
      price: rand(200..1500),
      menu: menu,
      sku: "menu-item"
      )
  end
end




