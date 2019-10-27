FactoryBot.define do
  factory :content do
    title { Faker::Lorem.sentence(word_count: 3) }
    plot { Faker::Lorem.paragraph(sentence_count: 2) }
    category { 1 }
  end
end
