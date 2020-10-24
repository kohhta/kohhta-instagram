FactoryBot.define do
  factory :article do
    content { Faker::Lorem.characters(number: 30) }
  end
end