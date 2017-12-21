FactoryBot.define do
  factory :category do
    name { Faker::Hipster.word.capitalize }

    association :vertical

    state :inactive
    trait :active do
      state :active
    end
  end
end
