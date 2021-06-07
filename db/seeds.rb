# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Table.destroy_all
Restaurant.destroy_all

puts "Creating a Restaurant"
  restaurant = Restaurant.create!(
    name: "Restaurant #{rand(1..5)}",
    latitude: 0,
    longitude: 0,
    user_id: 2
  )

puts "Creating 5 Tables"
5.times do
  table = Table.create!(
    number_of_table: rand(1..8),
    capacity: rand(1..4),
    status: "available",
    restaurant_id: 4
  )
end
