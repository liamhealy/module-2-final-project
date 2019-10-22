# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Note.destroy_all
Group.destroy_all
Comment.destroy_all


50.times do
    username = Faker::Name.first_name
    age = (20...50).to_a.sample
    location = Faker::Nation.capital_city
    bio = Faker::Job.title
    User.create(username: username, age: age, location: location, bio: bio)
  end

10.times do
    title = Faker::Company.name
    theme = Faker::Types.rb_string
    description = Faker::Marketing.buzzwords
    Group.create(title: title, theme:theme, description: description)
end

50.times do
    user_id = (1...50).to_a.sample
    group_id = (1...10).to_a.sample
    GroupMember.create(user_id:user_id, group_id:group_id)
end

100.times do
    title = Faker::Marketing.buzzwords
    content = Faker::Marketing.buzzwords
    group_member_id = (1...50).to_a.sample
    Note.create(title: title, content: content, group_member_id: group_member_id)
end

500.times do
    note_id = (1...100).to_a.sample
    content = Faker::Marketing.buzzwords
    Comment.create(note_id:note_id, content:content)
end