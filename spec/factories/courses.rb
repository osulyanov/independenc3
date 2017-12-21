FactoryBot.define do
  factory :course do
    name { Faker::Hipster.sentence(3, false, 7) }
    author { Faker::Name.name }

    association :category

    state :inactive
    trait :active do
      state :active
    end
  end
end
