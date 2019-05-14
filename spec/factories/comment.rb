FactoryBot.define do
	factory :comment do
		title { Faker::Lorem.sentence(3) }
		body { Faker::Lorem.paragraph(3, 50) }
		post
		user
	end
end