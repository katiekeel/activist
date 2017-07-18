# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Group.destroy_all
Interest.destroy_all
Event.destroy_all

interest_names = ["Politics", "Women", "Children", "Economy", "Social"]

(1..5).each do |num|
  Interest.create!(name: interest_names[num])
end

interests = Interest.all

group_names = ["Bernie Campaign", "Women's March", "March of Dimes", "DSA Denver", "Cool People"]
descriptions = ["Volunteer for Bernie Sanders in Denver", "March against anti-woman ideas", "Medical research for babies", "Advancing democratic socialist ideas", "Just having fun"]

(1..5).each do |num|
  Interest.find(num).events.create!(name: group_names[num], description: groups[num])
end

groups = Group.all

event_names = ["Canvassing Park Hill", "Denver Women's March", "Bake Sale Fundraiser", "Organizing Meeting", "Bar Crawl"]
event_descriptions = ["Constituent outreach in Park Hill", "Peacful march to advance pro-woman rhetoric", "Selling cookies at a local concert", "Strategy meeting for member outreach", "Tasty craft beers"]

(1..5).each do |num|
  Group.find(num).events.create!(name: event_names[num], description: event_descriptions[num], start_date: "2017-05-0#{num}", end_date: "2017-05-0#{num}", start_time: "0#{num}:00)", end_time: "0#{num +1}:00", location: "Denver", zipcode: "1234#{num}".to_i)
end
