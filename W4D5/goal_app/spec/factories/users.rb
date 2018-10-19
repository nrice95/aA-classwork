FactoryBot.define do
  factory :user do
    username { Faker::RickAndMorty.character}
    password { "starwars"}
  end
end
