# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Task.destroy_all
User.destroy_all


will = User.create(name: 'Will', username: 'willuser', password: 'password')
bob = User.create(name: 'Bob', username: 'bobman', password: 'password')
guy = User.create(name: 'Guy', username: 'guyson', password: 'password')

Task.create(title: "Attack Titan", description: "I need help doing stuff", volunteersNeeded: 5, user: will)
Task.create(title: "Drawing Tips", description: "I need help learning how to draw", volunteersNeeded: 2, user: will)
Task.create(title: "Build a Spaceship", description: "I want to build a spaceship to fly to the moon", volunteersNeeded: 3, user: bob)
Task.create(title: "Launch a Spaceship", description: "Once i get my spaceship, I need help launching it", volunteersNeeded: 99, user: bob)
Task.create(title: "Make Money", description: "I'm printing money, shh dont tell anyone", volunteersNeeded: 7, user: guy)
Task.create(title: "Eat Food", description: "I need some one to help me eat all of this food", volunteersNeeded: 9, user: guy)