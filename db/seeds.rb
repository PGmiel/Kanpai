# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

MenuItem.destroy_all
Menu.destroy_all
Table.destroy_all
Restaurant.destroy_all
User.destroy_all

puts "creating a User"
  user = User.create!(
    first_name: 'Johnny',
    last_name: 'Bravo',
    email: 'johnny.bravo@cn.com',
    password: "123123",
    status_owner: 'owner'
  )

puts "Creating a Restaurant"
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    latitude: rand(50..51),
    longitude: rand(4..5),
    user: user,
  )


puts "Creating Tables"
5.times do |n|
    table = Table.create!(
      number_of_table: n + 1,
      capacity: rand(1..12),
      status: "available",
      restaurant: restaurant
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
      category: ["food", "dessert", "drink"].sample,
      price: rand(2..15),
      menu: menu
  )
  end





