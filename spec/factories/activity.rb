FactoryBot.define do
  factory :activity do
    title { Faker::StarWars.character }
    status false
    trip
  end
end
