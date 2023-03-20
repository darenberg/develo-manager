require 'faker'

user1 = User.create!(email: "pana@gmail.com", password: "123456")

puts 'Creating 100 fake  notes...'
100.times do
  Note.create(
    title: Faker::ChuckNorris.fact,
    content: Faker::Fantasy::Tolkien.poem,
    category: Faker::Book.genre,
    tag:  Faker::Hobby.activity,
    user_id: user1
  )
end
puts 'Finished!'

puts 'Creating 100 fake  projects...'
100.times do
  Project.create(
    title: Faker::Book.title
  )
end

puts 'Creating 100 fake  rooms...'
100.times do
  Room.create(
    name: Faker::House.room
  )
end


puts 'Finished!'
