FactoryBot.define do
  factory :category do
    name { Faker::Hipster.word.capitalize }

    association :vertical

    status :inactive
    trait :active do
      status :active
    end
  end
end
