FactoryBot.define do
  factory :user do
    user_name { Faker::Name.first_name }
    email { Faker::Internet.free_email }
    password { '1a2b3c' }
    password_confirmation { password }
  end
end
