# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

File.open('public/missions.txt', 'r') do |f|
  f.each_line do |line|
    Mission.create(:description => line)
  end
end

User.create(:email => 'berlimioz@gmail.com', :password => 'password', :pseudo => 'Berlimioz')
