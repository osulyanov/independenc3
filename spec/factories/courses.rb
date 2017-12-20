FactoryBot.define do
  factory :course do
    name { Faker::Hipster.sentence(3, false, 7) }
    author { Faker::Name.name }

    association :category

    status :inactive
    trait :active do
      status :active
    end
  end
end
