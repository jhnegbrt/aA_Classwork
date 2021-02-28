# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all
Toy.destroy_all
Customer.destroy_all

category1 = Category.create!(category: "Stuffed Animal")
category2 = Category.create!(category: "Food")


toy1 = Toy.create!(name: "Burger", brand: "Hasbro", price: 10, category: category2)
toy2 = Toy.create!(name: "George", brand: "Beanie Babies", price: 5, category: category1)

customer1 = Customer.create!(first_name: "Erin", last_name: "Silly", age: 6)

