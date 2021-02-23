# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: "John")
user2 = User.create(username: "Sally")

poll = Poll.create(title: "Do you like Ruby?")

question = Question.create(poll_id: 1, text: "Is ruby your favorite language?")

answer1 = AnswerChoice.create(text: "yes!")
answer2 = AnswerChoice.create(text: "nope")

response1 = Response.create(user_id: user1, answer_id: answer2)
response2 = Response.create(user_id: user1, answer_id: answer1)




