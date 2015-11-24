# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

building = Building.create([{name: "NewBB"},{name: "Swap"},{name: "Giga"},{name: "SUPAAA"}])

Building.all.each do |building|
	10.times do |i|
		BuildingLevel.create(building_id: building.id, level: i+1,beer: Random.rand(1000),vodka: Random.rand(1000),food: Random.rand(1000),stone: Random.rand(1000))	
	end
end 