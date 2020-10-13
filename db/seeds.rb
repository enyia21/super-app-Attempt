
require 'faker'
# require 'rest'

require 'rest-client'
100.times do
    userId = rand(1..700)
    superhero_character_url = "https://superheroapi.com/api/10215771175427274/#{userId}"
    superhero_character = RestClient.get superhero_character_url
    superhero_character_array = JSON.parse(superhero_character)

    hero = Superhero.new(
        name: superhero_character_array["name"],
        gender: superhero_character_array["appearance"]["gender"],
        power_level: superhero_character_array["powerstats"]["power"],
        full_name: superhero_character_array["biography"]["full-name"],
        place_of_birth: superhero_character_array["biography"]["place-of-birth"],
        publisher: superhero_character_array["biography"]["publisher"],
        alignment: superhero_character_array["biography"]["alignment"],
        team_affiliation: superhero_character_array["connections"]["group-affiliation"],
        image: superhero_character_array["image"]["url"]   
    )
    hero.save
end

10.times do 
    firstName = Faker::Name.first_name
    lastName = Faker::Name.unique.last_name
    email = Faker::Internet.safe_email(name: lastName)
    age = rand(10..50)
    new_user = User.create(
        first_name: firstName,
        last_name: lastName,
        email: email,
        age: age
    )

    new_team = new_user.teams.build(name: Faker::Beer.unique.brand)
    if new_team.save
        5.times do
            random_id = rand(1..40)
            new_team.superheros << Superhero.find(random_id)
        end
    end
    
end