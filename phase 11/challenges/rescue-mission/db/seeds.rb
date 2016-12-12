# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(
  username: "TimeBomb",
  first_name: "Corey",
  last_name: "Votta",
  email: "cvotta@seczetta.com",
  password: "password"
)

question = Question.create(
  title: "Rails Question",
  body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer lectus libero, auctor quis condimentum aliquet, dignissim vel orci. Curabitur imperdiet ipsum nunc, eget dapibus lorem laoreet a. Donec dapibus nibh et ipsum gravida egestas. Quisque ullamcorper ultricies sapien, eget gravida mi feugiat vel. Proin magna magna, laoreet in nisi a, lobortis mollis enim. Duis quis libero ligula. Aenean faucibus nisl id risus eleifend euismod. Fusce ac magna enim. Nullam scelerisque at ligula aliquam rhoncus. Cras at volutpat nisi. Quisque vel dui massa. Sed at pretium mi, efficitur consectetur elit. Phasellus eros nisl, sollicitudin id scelerisque ac, finibus a velit. Pellentesque.",
  user_id: user.id,
  views: 100
)