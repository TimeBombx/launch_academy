# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Manufacturer.create!(name: "Dodge", country: "America")
Manufacturer.create!(name: "Ford", country: "America")
Manufacturer.create!(name: "Kia", country: "Korean")
m = Manufacturer.create!(name: "Nissan", country: "Japan")
Car.create!(model: "Altima", year: 1995, color: "black", mileage: 182000, manufacturer_id: m.id)