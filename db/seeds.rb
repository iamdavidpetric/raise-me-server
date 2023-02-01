# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.find_or_initialize_by(email: 'david.petric99@gmail.com').tap do |user|
  user.first_name = 'David'
  user.last_name = 'Petric'
  user.email = 'david.petric01@gmail.com'
  user.username = 'iamdavidpetric'
  user.password = 'Salam123'
  user.save
end
