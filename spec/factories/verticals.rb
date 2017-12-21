FactoryBot.define do
  factory :vertical do
    name { Faker::Hipster.word.capitalize }

    trait :with_categories do
      transient do
        amount { Faker::Number.between(2, 5) }
      end

      after(:create) do |vertical, evaluator|
        create_list :category_with_courses, evaluator.amount, vertical: vertical
      end
    end

    factory :verticals_with_categories, traits: [:with_categories]
  end
end
