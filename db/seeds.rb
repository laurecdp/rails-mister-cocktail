require 'json'
require 'open-uri'

Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

ingredients_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
serialized_ingredients = open(ingredients_url).read
list_of_ingredients = JSON.parse(serialized_ingredients)
ingredients = list_of_ingredients['drinks']
puts 'Adding ingredients...'

ingredients.each do |list_ingredients|
  ingredient_names = list_ingredients.values
  ingredient_names.each do |ingredient|
    Ingredient.create(name: ingredient)
  end
end

puts "#{Ingredient.all.count} ingredients added"

cocktail_url = 'https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json'
serialized_cocktails = open(cocktail_url).read
list_of_cocktails = JSON.parse(serialized_cocktails)
puts 'Creating cocktails...'

list_of_cocktails.each do |cocktail|
  Cocktail.create(name: cocktail['name'],
                  preparation: cocktail['preparation'])
end

puts "#{Cocktail.all.count} cocktails added"

puts 'Finished!'
