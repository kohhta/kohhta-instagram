# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jon = User.create!(email: 'jon@example.com', password: 'password', username: 'jon')
emily = User.create!(email: 'emily@example.com', password: 'password',username: 'emily')

5.times do
  jon.articles.create!(
    content: Faker::Lorem.sentence(word_count: 10)
  )
end

5.times do
  emily.articles.create!(
    content: Faker::Lorem.sentence(word_count: 20)
  )
end
