# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
m = Meetup.create(title: "Ruby Meetup", user_id: 1, description: "Sit around and talk about ruby stuff with new people", location: "Boston")
u = User.create(provider: "github",	uid: 20706639, username: "Corey Votta", email: "cvotta@seczetta.com", avatar_url: "https://avatars.githubusercontent.com/u/20706639?v=3")
UserMeetup.create(meetup_id: m.id, user_id: u.id)

Comment.create(user_id: u.id, meetup_id: m.id, body: "This is going to be a fun meetup")