FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    username{'testuser'}
  end
end