FactoryBot.define do
  factory :budget_items do |f|
    f.item { Faker::StarWars.character }
    f.description { Faker::Lorem.sentence(10) }
    f.cost { Faker::Number.number(10) }
    f.trip_id
  end
end
