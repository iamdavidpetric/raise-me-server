# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.find_or_initialize_by(email:"david.petric99@gmail.com").tap do |user|
    user.first_name= "David"
    user.last_name= "Petric"
    user.email= "david.petric01@gmail.com"
    user.username= "iamdavidpetric"
    user.save
end 

project = Project.create!({user_id:user.id, goal:5000, fee:50, deadline:"11/11/2023", name:"Backpack 7 in 1", category:'garden', statement:"hai si joaca in hora", description:"aim is to remove the stresses of packing and organising for outdoor activities so that people can souly enjoy the positives of an active outdoor lifestyle. All the prototyping and research of the product have already been carried out, so the purpose of the funds are to finalise the design and begin manufacture as soon as possible Once the minimum target has been reached, a website will be made available to pre-order All Access backpacks until a reliable manufacturer has been sourced, after which shipping will begin right away.", 
    images:[ "https://i.imgur.com/O4vo5Uf.jpg",
        "https://i.imgur.com/kHgmAGw.jpg",
    "https://i.imgur.com/HJcS8Xc.jpg",
    "https://i.imgur.com/O4vo5Uf.jpg",
    "https://i.imgur.com/kHgmAGw.jpg",
    "https://i.imgur.com/HJcS8Xc.jpg",
    "https://i.imgur.com/O4vo5Uf.jpg",
    "https://i.imgur.com/kHgmAGw.jpg" ] })

    team_member = TeamMember.create([
        {name:"Geanina", avatar_url:"https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80", project_id:project.id},
        {name:"Robert", avatar_url:"https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80", project_id:project.id},
        {name:"Alex", avatar_url:"https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80", project_id:project.id},
        {name:"Doru", avatar_url:"https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80", project_id:project.id},
        {name:"Paul", avatar_url:"https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80", project_id:project.id},
        {name:"Laura", avatar_url:"https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80", project_id:project.id},
        {name:"Vlad", avatar_url:"https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80", project_id:project.id}])
    investor = Investor.create([{user_id:user.id, project_id:project.id, ammount: 50},
        {user_id:user.id, project_id:project.id, ammount: 50},
        {user_id:user.id, project_id:project.id, ammount: 50},
        {user_id:user.id, project_id:project.id, ammount: 50},
        {user_id:user.id, project_id:project.id, ammount: 50}])


