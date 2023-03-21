require 'faker'

user1 = User.create!(email: "pana@gmail.com", password: "123456")

puts 'Creating 100 fake everything...'

10.times do
  Project.create(
    title: Faker::Book.title
  )
end
10.times do
  Floor.create(
    floor_number: (-3..3).rand
  )
end
10.times do
  Plan.create(
    floor_id: Floor.all.sample
  )
end
10.times do
  Dot.create(
    plan_id: Plan.all.sample
  )
end
10.times do
  Task.create(
    title: Faker::ChuckNorris.fact,
    content: Faker::Fantasy::Tolkien.poem,
    category: Faker::Book.genre,
    tag:  Faker::Hobby.activity,
    user_id: user1
  )
end


user1 = User.create!(email: "pana@gmail.com", password: "123456", admin: true, proyect_id: project.all.sample )
user2 = User.create!(email: "soyiben@gmail.com", password:"123456", admin: true, proyect_id: project.all.sample)
user3 = User.create!(email: "betech35@gmail.com", password:"123456", admin: true, proyect_id: project.all.sample)

10.times do
  User_task.create(
    user_id: User.all.sample,
    task_id: Task.all.sample
  )
end
puts 'Finished!'
