# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

game1 = Game.create(title: "Jumpman 4d", genre: "Platforming", description: "Jumpman go jump", price: 45.99)
game2 = Game.create(title: "Tetris", genre: "puzzles", description: "greatest game", price: 45.50)

user1 = User.create(username: "kwan")
user3 = User.create(username: "craig")
user3 = User.create(username: "joshua")

review1 = Review.create(review: "Nice game", game_id: game1.id, user_id: user1.id)