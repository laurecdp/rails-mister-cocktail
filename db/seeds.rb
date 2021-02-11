# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first

require 'json'
require 'open-uri'

ingredients_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cocktail_url = 'https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json'

serialized_cocktails = open(cocktail_url).read
serialized_ingredients = open(ingredients_url).read

list_of_cocktails = JSON.parse(serialized_cocktails)
list_of_ingredients = JSON.parse(serialized_ingredients)

Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

ingredients = list_of_ingredients['drinks']

puts 'Creating fake ingredients...'

50.times do
  ingredients.each do |ingredient|
    ingredient_name = ingredient.values
    Ingredient.create(name: ingredient_name)
  end
end

50.times do
  list_of_cocktails.each do |cocktail|
    Cocktail.create(name: cocktail['name'])
  end
end

puts 'Finished!'
