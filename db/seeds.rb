# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all



p user = User.create!(email: "test@test.com", username: 'Allison', password: 123123)
p event1 = Event.create!(name: 'LISTEN!', location: 'Fuse',city: "Brussels", date: Time.now, artist: 'Peggy F* Gou', user: user)
p song_r = SongRequest.create!(input: "What's the name of this track?", event: event1, user: user)
p co1 = Comment.create!(commentable: song_r, user: user, input: "First comment")
p co2 = Comment.create!(commentable: co1, user: user, input: "Second comment")


user = User.create!(email: 'seed@seed.seed', password: 'password', password_confirmation: 'password', username: 'testibo')

Event_attribute = [
{
  name: "LISTEN!",
  location: "Fuse",
  city: "Brussels",
  artist: "Peggy F* Gou",
  date: Time.now,
  user: user
}
]


