# # # This file should contain all the record creation needed to seed the database with its default values.
# # # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# # #
# # # Examples:
# # #
# # #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# # #   Character.create(name: "Luke", movie: movies.first)


# # # app/db/seeds.rb
 require 'open-uri'



Character.delete_all

# # # Define a method to fetch data from the API
def fetch_api_data(url)
   response = URI.open(url)
   JSON.parse(response.read)
 end

# # # Fetch data from the API
 character_details_response = fetch_api_data('https://rickandmortyapi.com/api/character')


 Category.create(name: 'Rare')
 Category.create(name: 'Common')
 Category.create(name: 'Uncommon')
 #puts character_details_response["info"]["next"]
while character_details_response["info"]["next"] do
  #puts character_details_response["results"].size

  # Seed the database
  character_details_response['results'].each do |character|

    categories = Category.all
    random_category = categories.sample


    Character.create!(
      name: character['name'],
      status: character['status'],
      species: character['species'],
      gender: character['gender'],
      location: character['location']['name'],
      price: Faker::Commerce.price(range: 100..1000),
      image: character['image'],
      category: random_category
     )
  end
  character_details_response = fetch_api_data(character_details_response["info"]["next"])
end


#### AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?