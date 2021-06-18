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
  first_name: 'Roch',
  last_name: 'de Vidts',
  email: 'Roch@gmail.com',
  password: "123123",
  status_owner: 'owner'
  )
users << user_1

user_2 = User.create!(
  first_name: 'Pierre-Guillaume',
  last_name: 'Amiel',
  email: 'pg@gmail.com',
  password: "123123",
  status_owner: 'owner'
  )
users << user_2

user_3 = User.create!(
  first_name: 'Kyrstin',
  last_name: 'Legrand',
  email: 'Kyrstin@gmail.com',
  password: "123123",
  )
users << user_3

user_4 = User.create!(
  first_name: 'Vincent',
  last_name: 'Herremans',
  email: 'Vincent@gmail.com',
  password: "123123",
  )
users << user_4


puts "Creating a Restaurant"
restaurant  = Restaurant.create!(
  name: 'Plein Publiek',
  address: 'Mont des Arts, 1000 Brussels',
  website: 'https://pleinpubliek.be/',
  phone_number: '0485 97 72 05',
  photo_url: 'https://www.actiefwonen.be/wp-content/uploads/2019/01/PLEINPUBLIEKIMAGEALUNE-1000x650.jpg',
  user: users.sample
  )

restaurant  = Restaurant.create!(
  name: 'Colonel',
  address: 'Rue Jean Stas 24, 1060 Brussels',
  website: 'https://pleinpubliek.be/',
  phone_number: '0485 97 72 05',
  photo_url: 'https://cdn.shopify.com/s/files/1/0257/8389/4067/files/DSC_4605_copie_1728x.jpg',
  user: users.sample
  )

restaurant  = Restaurant.create!(
  name: 'Nona',
  address: 'Rue Sainte-Catherine 17-19, 1000 Brussels',
  website: 'https://www.nonalife.com/',
  phone_number: '0485 97 72 05',
  photo_url: 'https://lp-cms-production.imgix.net/2019-06/ecf1567a8e869dce9ef8ea789034177e-lpl-nona-1.jpg',
  user: users.sample
  )

restaurant  = Restaurant.create!(
  name: 'Brasserie de la Ville',
  address: 'Rue des Chapeliers 14, 1000 Brussels',
  website: 'https://www.brasseriedelaville.be/en/',
  phone_number: '02 513 68 88',
  photo_url: 'https://www.brasseriedelaville.be/i/brasserie-de-la-ville-304868/3/4/5/9/5/1/1/4/1/3/8/1457347171_229/15f2923bcf91691615a067d3fe8e8f63.jpg',
  user: users.sample
  )

restaurant  = Restaurant.create!(
  name: 'Mer du Nord',
  address: 'Sint-Katelijnestraat 45, 1000 Brussels',
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
  photo_url: 'https://lp-cms-production.imgix.net/2019-06/c5ad61c161a1848c663791328abae350-lpl-comptoir_rodin-1.jpg',
  user: users.sample
  )


restaurant  = Restaurant.create!(
  name: 'Palo Alto',
  address: '35 Rue Tasson-Snel, 1060 Brussels',
  website: 'https://www.paloaltoginfood.be/',
  phone_number: '0485 97 72 05',
  photo_url: 'https://lp-cms-production.imgix.net/2019-06/8a1512e5c8a631f6d8b133def4bdcb64-lpl-palo_alto-1.jpg',
  user: users.sample
  )


restaurant  = Restaurant.create!(
  name: 'Big Mama',
  address: 'Oud Korenhuis 41, 1000 Brussels',
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
  photo_url: 'https://lp-cms-production.imgix.net/2019-06/2683622f9fc73887ceafb413a3e2d992-hortense-humus.jpg',
  user: users.sample
  )

# 15.times do
#   puts "Creating a Restaurant"
#   restaurant = Restaurant.create!(
#     name: Faker::Restaurant.name,
#     address: Faker::Address.full_address,
#     # address:  Faker::Config.locale=(nl_BE).address,
#     # latitude: rand(50..51),
#     # longitude: rand(4..5),
#     user: users.sample
#     )
# end

restaurants = Restaurant.all
restaurants.each do |restaurant|
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
  menu_items = MenuItem.create!(
    item_name: "Jasmin tea",
    category: "Hot Drinks",
    price: 300,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Expresso",
    category: "Hot Drinks",
    price: 250,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Americano",
    category: "Hot Drinks",
    price: 400,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Lava cake",
    category: "Dessert",
    price: 700,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Banana Split",
    category: "Dessert",
    price: 800,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Dame Blanche",
    category: "Dessert",
    price: 650,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Stella",
    category: "Beers",
    price: 350,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Jupiler",
    category: "Beers",
    price: 250,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Troubadour Magma",
    category: "Beers",
    price: 500,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Leffe",
    category: "Beers",
    price: 450,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Chateau Kanpai",
    category: "Wine",
    price: 1500,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Chateau St-Emillion",
    category: "Wine",
    price: 2500,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Belgian Plate",
    category: "Starter",
    price: 1000,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Bruschetta",
    category: "Starter",
    price: 800,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Cheese Croquette",
    category: "Starter",
    price: 900,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Entrecôte Frites",
    category: "Main Dishes",
    price: 2500,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Vol-au-Vent",
    category: "Main Dishes",
    price: 1800,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Moules Frites",
    category: "Main Dishes",
    price: 2000,
    menu: menu,
    sku: "menu-item"
    )

  menu_items = MenuItem.create!(
    item_name: "Carbonnade Flamande",
    category: "Main Dishes",
    price: 2100,
    menu: menu,
    sku: "menu-item"
    )
end
