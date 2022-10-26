FactoryBot.define do
  factory :user do
    username { Faker::Movies::HarryPotter.character }
    password { "starwars" }

    factory :harry_potter do 
      username { "Harry Potter" }
    end 
    
  end
end
