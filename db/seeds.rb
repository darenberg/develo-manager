require 'faker'

user = User.create(email: "pana_admin@gmail.com", password: "123456", admin: true)
User.create!(email: "olivia@gmail.com", password: "123456")
User.create!(email: "soyiben@gmail.com", password: "123456")
User.create!(email: "betech35@gmail.com", password: "123456")

project = Project.create(title: Faker::Book.title, owner: user)

User.all.each do |user|
  ProjectUser.create(project: project, user: user)
end

min_floor = (-2..0).to_a.sample
max_floor = (1..2).to_a.sample
floor_numbers = (min_floor..max_floor).to_a
floor_numbers.each do |number|
  Floor.create(
    number: number,
    project: project
  )
end

Floor.all.each do |floor|
  Plan::STAGES.each do |stage|
    Plan.create(
      stage: stage,
      floor: floor
    )
  end
end

Plan.all.each do |plan|
  rand(1..8).times do
    dot = Dot.create(plan: plan)
    rand(1..5).times do
      Task.create(dot: dot,
        title: Faker::Book.title,
  content: Faker::Fantasy::Tolkien.poem,
  # category: Faker::Book.genre,
)
end
end
end

Task.all.each do |task|
  3.times do
    Tag.create(task: task, tag_name: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true),)
  end
  number_of_users = rand(1..4)
  User.all.sample(number_of_users).each do |user|
    UserTask.create(
      task: task,
      user: user
    )
  end
end


puts 'Finished!'
