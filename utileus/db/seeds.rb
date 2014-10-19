# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(name: 'William Shakespeare', email: "billy@shakes.com", password: "hamlet1996", password_confirmation: "hamlet1996")
profession = user.professions.create(name: 'Playwright')
list = user.lists.create(name: 'My Plays')
apps = list.apps.create([{ name: 'Hamlet', url: "www.example.com/hamlet" }, { name: 'Othello', url: "www.example.com/othello"}, { name: "Romeo & Juliet", url: "www.example.com/rnj" }, { name: "Macbeth", url: "www.example.com/mac" }])