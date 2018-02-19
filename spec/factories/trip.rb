FactoryBot.define do
  factory :trip do
    name { Faker::StarWars.character }
    description { Faker::Lorem.sentence(10) }
    location "Lagos, Nigeria"
    departure_date Date.today
    return_date Date.today + 10.days
    user

    factory :trip_with_budget_items_and_activities do
      after(:create) do |trip|
        trip.budget_items << create_list(:budget_item, 5)
        trip.activities << create_list(:activity, 5)
      end
    end
  end
end
