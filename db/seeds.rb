# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
    first_name: '福田',
    last_name: '匠磨',
    email: 'fukuda.takuma695@mail.kyutech.jp',
    role: 1,
    password: 'aaa',
    password_confirmation: 'aaa',
)

10.times do
  User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: 'aaa',
      password_confirmation: 'aaa'
  )
end

20.times do |index|
  Board.create!(
      user: User.offset(rand(User.count)).first,
      title: "タイトル#{index}",
      body: "本文#{index}"
  )
end
