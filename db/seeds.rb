# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

serialized_drinks = open(url).read

drinks = JSON.parse(serialized_drinks)
ingredients = drinks['drinks']
ingredient = []

puts 'Creating 10 fake ingredients...'

Ingredient.destroy_all

# 10.times do
#   ingredients.each do |drink|
#     ingredient << drink['drinks']
#       ingredient.each do |i|
#      Ingredient.create(name: i)
#       end
#   end
# end

Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")
Ingredient.create(name: "soda")

puts 'Finished!'
