FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password 'password123'
    password_confirmation 'password123'

    factory :user_with_trips do
      after(:create) do |user|
        user.trips << create_list(:trip_with_budget_items_and_activities, 5)
      end
    end
  end
end
