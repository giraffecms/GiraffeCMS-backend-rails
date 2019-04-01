FactoryBot.define do
	factory :post do
		title { Faker::Lorem.sentence(3) }
		body { Faker::Lorem.paragraph(3, 50) }
	end
end