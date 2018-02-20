FactoryBot.define do
  factory :user do |f|
    f.email { Faker::Internet.free_email }
    f.password { 'vanessa' }
    f.password_confirmation { 'vanessa' }
  end
end
