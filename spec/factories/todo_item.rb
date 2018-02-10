FactoryBot.define do
  factory :todo_item do |f|
    f.title { Faker::StarWars.character }
    f.status false
    f.trip_id
    f.budget
  end
end
