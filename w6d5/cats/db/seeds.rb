# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cat1 = Cat.create(birth_date: "2013/02/10", name: "Pearl", description: "Pearl is energetic", sex: "F", color: "White")

cat2 = Cat.create(birth_date: "2015/02/10", name: "Hairy", description: "Hairy has a lot of fur", sex: "M", color: "Black")
