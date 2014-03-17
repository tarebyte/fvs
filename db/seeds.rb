# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create an admin and guest
m = User.create(
    name: "Mark Tareshawty",
    email: "tarebyte@gmail.com",
    password: "foobar",
    password_confirmation: "foobar",
    slug: "mark-tareshawty",
    admin: true
)

m2 = User.create(
  name: "Max Mauerman",
  email: "max.mauerman@gmail.com",
  password: "foobar",
  password_confirmation: "foobar",
  slug: "max-maueman",
  admin: false
)

# TODO this is shitty but I'll come back to it
m.save!(validate: false)
m2.save!(validate: false)
m.save
m2.save

p = Post.create(
    title: "Looking for lighting guy",
    content: "Hey all, I'm looking for a guy to run the lights",
    author_id: m.id,
    slug: "looking-for-lighting-guy"
)

p2 = Post.create(
    title: "Need help with a movie",
    content: "I will pay you in equity ASAP",
    author_id: m2.id,
    flagged: true,
    slug: "need-help-with-a-movie"
  )

p3 = Post.create(
    title: "For Hire: engineer",
    content: "I'm an awesome dude hire me",
    author_id: m2.id,
    slug: "for-hire-engineer"
  )

p4 = Post.create(
    title: "Need a beautiful actress",
    content: "The most beautiful you have ever seen",
    author_id: m.id,
    slug: "need-a-beautiful-actress"
  )


  p.save!
  p2.save!
  p3.save!
  p4.save!
