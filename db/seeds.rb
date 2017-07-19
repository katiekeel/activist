# require 'database_cleaner'
#
# DatabaseCleaner.strategy = :truncation
#
# DatabaseCleaner.clean

Group.destroy_all
Interest.destroy_all
Event.destroy_all
User.destroy_all

user_names = ["user1", "user2", "user3"]
passwords = ["pass1", "pass2", "pass3"]

3.times do |num|
  User.create!(name: user_names[num], password: passwords[num], role: 0)
end

User.create!(name: "admin", password: "admin", role: 1)
User.create!(name: "contact", password: "contact", role: 2)

interest_names = ["Politics", "Women", "Children", "Economy", "Social"]

5.times do |num|
  Interest.create!(name: interest_names[num])
end

interests = Interest.all

group_names = ["Bernie Campaign", "Women's March", "March of Dimes", "DSA Denver", "Cool People"]
group_descriptions = ["Volunteer for Bernie Sanders in Denver", "March against anti-woman ideas", "Medical research for babies", "Advancing democratic socialist ideas", "Just having fun"]

user = User.find(5)

5.times do |num|
  Interest.find(num+1).groups.create!(name: group_names[num], description: group_descriptions[num], contact: user)
end

groups = Group.all

event_names = ["Canvassing Park Hill", "Denver Women's March", "Bake Sale Fundraiser", "Organizing Meeting", "Bar Crawl"]
event_descriptions = ["Constituent outreach in Park Hill", "Peacful march to advance pro-woman rhetoric", "Selling cookies at a local concert", "Strategy meeting for member outreach", "Tasty craft beers"]

5.times do |num|
  Group.find(num+1).events.create!(name: event_names[num], description: event_descriptions[num], start_date: "2017-05-01", end_date: "2017-05-02", start_time: "01:00)", end_time: "02:00", location: "Denver", zipcode: 12345)
end

5.times do |num|
  Interest.find(num+1).events << Event.find(num+1)
end

5.times do |num|
  User.find(num+1).groups << Group.find(num+1)
end

5.times do |num|
  User.find(num+1).events << Event.find(num+1)
end

5.times do |num|
  User.find(num+1).interests << Interest.find(num+1)
end
