FactoryBot.define do
  factory :vertical do
    name { Faker::Hipster.word.capitalize }
  end
end
