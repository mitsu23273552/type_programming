FactoryBot.define do
  factory :question do
    association :user
    title { Faker::Lorem.sentence }
    answer { Faker::Lorem.sentence }
    commentary { Faker::Lorem.sentence }
    question_level_id { Faker::Number.between(from: 1, to: 5) }
  end
end
