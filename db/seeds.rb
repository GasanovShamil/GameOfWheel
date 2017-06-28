# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#################### Users

User.create!({:username => "Administrateur", :email => "admin@mail.com", :password => "password", :password_confirmation => "password" })
u = User.last
u.add_role :admin

User.create!({:username => "Utilisateur", :email => "user@mail.com", :password => "password", :password_confirmation => "password" })

#################### Categories

Category.create!({:name => "High Tech" })
Category.create!({:name => "Téléphonie" })
Category.create!({:name => "Sport" })
Category.create!({:name => "Nature" })
Category.create!({:name => "Informatique" })
Category.create!({:name => "Jeux" })

#################### Prizes

Prize.create!({:name => "IPhone 7", :description => "Téléphone apple", :photo_path => nil, :price => 799.99 })
Prize.create!({:name => "VTT BTwin", :description => "Superbe vélo tout terrain", :photo_path => nil, :price => 347.49 })
Prize.create!({:name => "Playstation 4", :description => "Console de jeu de salon par Sony", :photo_path => nil, :price => 399 })

#################### PrizeCategories

PrizeCategory.create!({:prize_id => 1, :category_id => 1 })
PrizeCategory.create!({:prize_id => 1, :category_id => 2 })
PrizeCategory.create!({:prize_id => 2, :category_id => 3 })
PrizeCategory.create!({:prize_id => 2, :category_id => 4 })
PrizeCategory.create!({:prize_id => 3, :category_id => 6 })

#################### Rooms

Room.create!({:winner => nil, :created_by => 1, :start_date => Date.parse('2017-06-01'), :end_date => Date.parse('2017-06-30'), :prize_id => 1, :share_price => 10 })
Room.create!({:winner => nil, :created_by => 1, :start_date => Date.parse('2017-06-05'), :end_date => Date.parse('2017-06-06'), :prize_id => 1, :share_price => 20 })
Room.create!({:winner => nil, :created_by => 1, :start_date => Date.parse('2017-06-10'), :end_date => Date.parse('2017-06-28'), :prize_id => 2, :share_price => 5 })
Room.create!({:winner => nil, :created_by => 1, :start_date => Date.parse('2017-06-01'), :end_date => Date.parse('2017-07-31'), :prize_id => 3, :share_price => 15 })
