FactoryBot.define do
  factory :subscriber do
    association :product
    sequence(:email) { |n| "user#{n}@example.org" }
  end
end
