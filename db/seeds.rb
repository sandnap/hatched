# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Destroy all records before seeding
MentorReview.destroy_all
ChatMessage.destroy_all
Chat.destroy_all
Session.destroy_all
MentorSkill.destroy_all
Mentor.destroy_all
User.destroy_all
Skill.destroy_all

skills = Skill.create(
  [
    { name: 'Ruby' }, { name: 'Rails' }, { name: 'JavaScript' }, { name: 'React' },
    { name: 'Vue' }, { name: 'Python' }, { name: 'Elixir' }, { name: 'Java' }
  ]
)

users = User.create(
  [
    { email: 'sandnap@gmail.com', password_hash: 'plain_text', username: 'Sandnap', phone: '888-555-1212' },
    { email: 'peter1112@gmail.com', password_hash: 'plain_text', username: 'Peter', phone: '888-555-1214' }
  ]
)

mentors = Mentor.create([{ rate_minutes: 15, rate: 25.00, user: users.first }])

MentorSkill.create(
  [
    { expertise: 10, skill: skills.first, mentor: mentors.first },
    { expertise: 10, skill: skills.second, mentor: mentors.first },
    { expertise: 9, skill: skills.third, mentor: mentors.first }
  ]
)

sessions = Session.create(
  [
    { scheduled_start_time: DateTime.now + 2.days, scheduled_minutes: 30,
      topic: 'Creating relationships in rails', mentor: users.first, mentee: users.second }
  ]
)

MentorReview.create(
  [
    { rating: 5,
      description: 'Sandnap was able to help me with everything I needed and was very professional',
      session: sessions.first }
  ]
)

chats = Chat.create([{ start_time: DateTime.now, is_closed: false, session: sessions.first }])

ChatMessage.create(
  [
    { user: users.second, message: 'Which model should carry the belongs_to attribute?',
      posted_at: DateTime.now - 5.minutes, chat: chats.first },
    { user: users.first, message: 'The todo model should belongs_to user',
      posted_at: DateTime.now, chat: chats.first }
  ]
)
