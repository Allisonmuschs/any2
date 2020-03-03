# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all


p user = User.create(email: "a@gmail.com", username: 'hello', password: 123123)
p event1 = Event.create(name: 'Party hard', location: 'Brussels', date: Time.now, artist: 'DJ K', user: user)
p song_r = SongRequest.create(input: "hello what s this song", event: event1, user: user)
p co1 = Comment.create(commentable: song_r, user: user, input: "hi first comment")
p co2 = Comment.create(commentable: co1, user: user, input: "hi second comment")

user = User.create(email: 'seed@seed.seed', password: 'password', password_confirmation: 'password')

Event_attribute = [
{
  name: "Fuse",
  location: "Brussels",
  artist: "PEg",
  date: Time.now,
  user: user
}

]
