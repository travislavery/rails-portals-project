# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

god = User.create(email: "god@gmail.com", name: "Jesus", password: "batman", god: true)

10.times do
	User.create(email: Faker::Internet.email, name: Faker::Name.name, password: "batman")
	Portal.create(location: Faker::LordOfTheRings.unique.location, user_id: god.id)
end



20.times do

	Quest.create(
	    title: Faker::Commerce.product_name,
	    priority: Faker::Number.between(1,100),
	    karma_impact: Faker::Number.between(-10, 10),
	    portal: Portal.all[Faker::Number.between(0, 10)]
	  )

end

Quest.all.each do |quest|
	Faker::Number.between(1,3).times do
		UserQuest.create(quest: quest, user: User.all[Faker::Number.between(0, 10)])
	end
end