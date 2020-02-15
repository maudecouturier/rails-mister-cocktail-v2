require 'json'
require 'open-uri'

Ingredient.destroy_all
Cocktail.destroy_all

puts 'Seeding ingredients'
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
url_serialized = open(url).read
ingredient_json = JSON.parse(url_serialized)
ingredients = ingredient_json['drinks']

ingredients.each do |ingredient|
  new_ingredient = Ingredient.new(name: ingredient['strIngredient1'])
  new_ingredient.save
end
puts "Finished seeding ingredients"

puts 'Seeding cocktails'
Cocktail.create(name: 'Mojito')
Cocktail.create(name: 'Bloody Mary')
puts 'Finished seeding cocktails'

