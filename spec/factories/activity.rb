FactoryBot.define do
  factory :activity do
    title { Faker::StarWars.character }
    status true
    trip
  end
end
