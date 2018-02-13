FactoryBot.define do
  factory :activities do |f|
    f.title { Faker::StarWars.character }
    f.status false
    f.trip_id
    f.budget
  end
end
