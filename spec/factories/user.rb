FactoryBot.define do
  factory :user do |f|
    f.email { Faker::Internet.free_email }
    f.password { Faker::Internet.password }
  end
end
