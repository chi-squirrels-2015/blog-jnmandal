# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  User.create! username: Faker::Internet.user_name, password: "password", password_confirmation: "password"
end

users = User.all

110.times do
  Post.create!(title: Faker::Lorem.sentence(3, true, 0), publish_date: Faker::Date.backward(90), content: Faker::Lorem.paragraph(8), user: users.sample)
end

posts = Post.all

30.times do
  Comment.create!(content: Faker::Lorem.paragraph(2), user: users.sample, post: posts.sample)
end

User.create! username: "jnmandal", password: "password", password_confirmation: "password"
