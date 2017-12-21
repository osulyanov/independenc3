FactoryBot.define do
  factory :category do
    name { Faker::Hipster.word.capitalize }

    association :vertical

    state :inactive
    trait :active do
      state :active
    end

    trait :with_courses do
      transient do
        amount { Faker::Number.between(2, 5) }
      end

      after(:create) do |category, evaluator|
        create_list :course, evaluator.amount, category: category
      end
    end

    factory :category_with_courses, traits: [:with_courses, :active]
  end
end
