FactoryBot.define do
  factory :purchase do
    price { 2.99 }
    quality { 1 }
    status { 0 }
    content { nil }
    user { nil }
    expires_at { Faker::Date.between(from: 2.days.ago, to: Date.today) }
  end
end
