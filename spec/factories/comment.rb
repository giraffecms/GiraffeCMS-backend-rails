FactoryBot.define do
	factory :comment do
		title { Faker::Lorem.sentence(3) }
		body { Faker::Lorem.paragraph(3, 50) }
		post
		association :author, factory: :user
	end
end