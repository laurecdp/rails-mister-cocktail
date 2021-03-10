require 'json'
require 'open-uri'

Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

ingredients_url = 'https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json'
serialized_ingredients = open(ingredients_url).read
list_of_ingredients = JSON.parse(serialized_ingredients)
puts 'Adding ingredients...'

list_of_ingredients.each do |ingredient|
  puts ingredient['ingredients']
  # ingredient_names.each do |ingredient|
  #   Ingredient.create(name: ingredient,
  #                     label: label)
  # end
end

puts "#{Ingredient.all.count} ingredients added"

cocktail_url = 'https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json'
serialized_cocktails = open(cocktail_url).read
list_of_cocktails = JSON.parse(serialized_cocktails)
puts 'Creating cocktails...'

list_of_cocktails.each do |cocktail|
  Cocktail.create(name: cocktail['name'],
                  glass: cocktail['glass'],
                  preparation: cocktail['preparation'],
                  garnish: cocktail['garnish'])
end

puts "#{Cocktail.all.count} cocktails added"

puts 'Finished!'
