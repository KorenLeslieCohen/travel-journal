# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

toothbrush = Supply.create(:name => "Toothbrush & Toothpaste")
contacts = Supply.create(:name => "Contacts, Solution, Glasses")
shampoo = Supply.create(:name => "Shampoo & Conditioner")
facewash = Supply.create(:name => "Face Wash")
razor = Supply.create(:name => "Razor")
brush = Supply.create(:name => "Brush")
makeup = Supply.create(:name => "Cosmetics")

swimsuit = Supply.create(:name => "Swimsuit")
towel = Supply.create(:name => "Beach Towel")
sunscreen = Supply.create(:name => "Sunscreen")
beachbag = Supply.create(:name => "Beach Bag")
sunglasses = Supply.create(:name => "Sunglasses")

camera = Supply.create(:name => "Camera")
phone = Supply.create(:name => "Phone")
computer = Supply.create(:name => "Computer/iPad/Kindle")
identification = Supply.create(:name => "License/Passport")
