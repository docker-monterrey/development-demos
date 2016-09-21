# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Poll.create_with(
  description: "What do you use to indent code in your app?",
  options: {
    a: "Tabs",
    b: "Spaces",
    c: "I don't indent code"
  }
).find_or_create_by(title: "Code indentation preference")
