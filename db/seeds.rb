require 'faker'

User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all

User.create([
  { username: "Dan", email:"dan@dan.dan", password:"password"},
  { username: "Ray", email:"Ray@Ray.Ray", password:"password"},
  { username: "Gino", email:"Gino@Gino.Gino", password: "password"},
  { username: "Marshall", email:"Marshall@Marshall.Marshall", password: "password"},
  ])

users = 50.times.map do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.safe_email, password: "password")
end

questions = 100.times.map do
  Question.create(user_id: users.sample.id, title: "#{Faker::Hacker.say_something_smart}???", body: Faker::Lorem.paragraph, view_count: rand(1..50))
end

answers = 300.times.map do
  Answer.create(user_id: users.sample.id, question_id: questions.sample.id, body: Faker::Hacker.say_something_smart)
end

comments = 500.times.map do
  Comment.create(user_id: users.sample.id, commentable_id: questions.sample.id, commentable_type: "Question", body: Faker::Hacker.say_something_smart)
end

commentsplus = 500.times.map do
  Comment.create(user_id: users.sample.id, commentable_id: answers.sample.id, commentable_type: "Answer", body: Faker::Hacker.say_something_smart)
end

votes = 500.times.map do
  Vote.create(user_id: users.sample.id, value: 1, voteable_id: questions.sample.id, voteable_type: "Question")
end

votesplus = 500.times.map do
  Vote.create(user_id: users.sample.id, value: 1, voteable_id: answers.sample.id, voteable_type: "Answer")
end

votescomms = 500.times.map do
  Vote.create(user_id: users.sample.id, value: 1, voteable_id: comments.sample.id, voteable_type: "Comment")
end

questions.each do |question|
  if rand(1..10) > 5
    question.accepted_answer = question.answers.sample
    question.save
  end
end
