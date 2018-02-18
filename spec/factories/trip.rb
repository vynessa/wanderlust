FactoryBot.define do
  factory :trip do
    name { Faker::Internet.free_email }
    description { Faker::Lorem.sentence(10) }
    location "Lagos, Nigeria"
    departure_date Date.today
    return_date Date.today + 10.days
    user
  end
end
