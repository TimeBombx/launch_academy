# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
include BCrypt
password = Password.create("password")
u = User.create!(username: "TimeBomb", password_hash: password, role: "admin", created_at: "2016-12-28 15:26:38", updated_at: "2016-12-28 15:26:38")
Review.create!(title: "Intel core i7 6700k review", body: "test", rating: 1, user_id: 1)