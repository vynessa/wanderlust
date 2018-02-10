FactoryBot.define do
  factory :trip do |f|
    f.name { Faker::Internet.free_email }
    f.description { Faker::Lorem.sentence(10) }
    f.user_id
    f.location
    f.departure_date
    f.return_date
  end
end
