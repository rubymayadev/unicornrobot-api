# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = [];
user_one = User.create!({
  email: 'mike@example.com',
  username: 'mike',
  password: "Squashing",
  password_confirmation: "Squashing",
  bio: "Couch surfer extraordinaire",
  jump_to: "entrepeneur",
  jump_from: "finance",
  first_name: "Mike",
  last_name: "Louis"
  })
user_two = User.create!({
  email: 'rory@example.com',
  username: 'rorita',
  password: "FigureSkating",
  password_confirmation: "FigureSkating",
  bio: "design and developments",
  jump_to: "Software development",
  jump_from: "design",
  first_name: "Rory",
  last_name: "Grant"
  })
user_three = User.create!({
  email: 'hanna@example.com',
  username: 'hanna',
  password: "DisneyOnIce",
  password_confirmation: "DisneyOnIce",
  bio: "worked in consulting but love svolunteering",
  jump_to: "Non-profit",
  jump_from: "consulting",
  first_name: "Hanna",
  last_name: "Banana"
  })
user_four = User.create!({
  email: 'Kat@example.com',
  username: 'kat',
  password: "Lacrosse",
  password_confirmation: "Lacrosse",
  bio: "blah blah blah",
  jump_to: "finance",
  jump_from: "Lacrosse",
  first_name: "Kat",
  last_name: "Pat"
  })
user_five = User.create!({
  email: 'Adam@example.com',
  username: 'Adam',
  password: "MyBMWYes",
  password_confirmation: "MyBMWYes",
  bio: "Mike's roommate",
  jump_to: "Teaching",
  jump_from: "Pro Kayaker",
  first_name: "Adam",
  last_name: "schmadam"
  })
user_six = User.create!({
  email: 'Matthew@example.com',
  username: 'Matt',
  password: "Explorer",
  password_confirmation: "Explorer",
  bio: "Loves backpacking",
  jump_to: "outdoor explorer",
  jump_from: "Hr recruiting",
  first_name: "Matt",
  last_name: "McMatt"
  })
user_seven = User.create!({
  email: 'Jenna@example.com',
  username: "Jenna",
  password: "YOGImama",
  password_confirmation: "YOGImama",
  bio: "Loves Yoga",
  jump_to: "Exercise application",
  jump_from: "Yoga instructor",
  first_name: "Jenna",
  last_name: "Janna"
  })
users.push(user_one, user_two, user_three, user_four, user_five, user_six, user_seven);
