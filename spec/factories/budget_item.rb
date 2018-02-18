FactoryBot.define do
  factory :budget_item do
    item { Faker::StarWars.character }
    description { Faker::Lorem.sentence(10) }
    cost { Faker::Number.number(10) }
    trip
  end
end
