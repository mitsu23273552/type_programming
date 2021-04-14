FactoryBot.define do
  factory :game do
    association :user
    record_1st { Faker::Number.between(from: 6000, to: 15000) }
    record_2nd { record_1st - 3000 }
    record_3rd { record_1st - 5000 }
  end
end
