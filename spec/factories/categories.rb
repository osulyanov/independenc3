FactoryBot.define do
  factory :category do
    name { Faker::Hipster.word.capitalize }

    association :vertical
    association :courses

    status :inactive
    trait :active do
      status :active
    end
  end
end
