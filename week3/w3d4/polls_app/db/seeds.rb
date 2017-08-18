# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(username: "cat")
u2 = User.create(username: "dog")
u3 = User.create(username: "bunny")

p1 = Poll.create(title: 'CATS!', author_id: u1.id)
p2 = Poll.create(title: 'DOGS!', author_id: u2.id)

q1 = Question.create(text: 'how many cats do you have?', poll_id: p1.id)
q2 = Question.create(text: 'cats?', poll_id: p1.id)
q3 = Question.create(text: 'how many dogs do you have?', poll_id: p2.id)
q4 = Question.create(text: 'dogs?', poll_id: p2.id)

a1 = AnswerChoice.create(text: 'one', question_id: q1.id)
a2 = AnswerChoice.create(text: 'lots', question_id: q1.id)
a3 = AnswerChoice.create(text: 'none', question_id: q1.id)
a4 = AnswerChoice.create(text: ':)', question_id: q2.id)
a5 = AnswerChoice.create(text: ':D', question_id: q2.id)
a6 = AnswerChoice.create(text: 'one - dogs', question_id: q3.id)
a7 = AnswerChoice.create(text: 'lots - dogs', question_id: q3.id)
a8 = AnswerChoice.create(text: 'none - dogs', question_id: q3.id)
a9 = AnswerChoice.create(text: ':) - dogs', question_id: q4.id)
a10 = AnswerChoice.create(text: ':D -dogs', question_id: q4.id)

Response.create(user_id: u2.id, answer_choice_id: a1.id)
Response.create(user_id: u2.id, answer_choice_id: a4.id)
Response.create(user_id: u3.id, answer_choice_id: a2.id)
Response.create(user_id: u3.id, answer_choice_id: a5.id)
Response.create(user_id: u1.id, answer_choice_id: a6.id)
Response.create(user_id: u1.id, answer_choice_id: a10.id)
Response.create(user_id: u3.id, answer_choice_id: a8.id)
Response.create(user_id: u3.id, answer_choice_id: a9.id)
