# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create!({ first_name: "David", last_name: "Petric", email:"david.petric99@gmail.com", username:"iamdavidpetric"})
project = Project.create({user_id:user.id, goal:100, deadline:"1/1/2023", name:"First project", description:"Ana are mere", team_members:["Razva", "Mihai", "George"], images:["https://imgur.com/gallery/o9KlhXy","https://imgur.com/gallery/ERBLgnJ", "https://imgur.com/gallery/B5ovshT" ] })
investor = Investor.create({user_id:user.id, project_id:project.id, ammount:10})


projects = Project.create! ([
    { user_id:user.id, goal:100, deadline:"1/1/2023", name:"First project", description:"Ana are mere", team_members:["Razva", "Mihai", "George"], images:["https://imgur.com/gallery/o9KlhXy","https://imgur.com/gallery/ERBLgnJ", "https://imgur.com/gallery/B5ovshT" ]},
    {user_id:user.id, goal:200, deadline:"2/1/2023", name:"Second project", description:"Ana n-are mere", team_members:["Razva2", "Mihai2", "George2"], images:["https://imgur.com/gallery/o9KlhXy","https://imgur.com/gallery/ERBLgnJ", "https://imgur.com/gallery/B5ovshT" ]},
    { user_id:user.id, goal:300, deadline:"3/1/2023", name:"Third project", description:"Ana ceva mere", team_members:["Razva3", "Mihai3", "George3"], images:["https://imgur.com/gallery/o9KlhXy","https://imgur.com/gallery/ERBLgnJ", "https://imgur.com/gallery/B5ovshT" ]}

])

users = User.create! ([
    { first_name: "David", last_name: "Petric", email:"david.petric99@gmail.com", username:"iamdavidpetric"},
    { first_name: "Paul", last_name: "Pop", email:"tod.petric99@gmail.com", username:"iampaulpetric"},
    {first_name: "ALex", last_name: "TOd", email:"papd.petric99@gmail.com", username:"iamalexetric"}
])

investors= Investor.create! ([
    {user_id:user.id, project_id:project.id, ammount:1000},
    {user_id:user.id, project_id:project.id, ammount:103},
    {user_id:user.id, project_id:project.id, ammount:101},
])