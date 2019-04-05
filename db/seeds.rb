require 'faker'

20.times do
	Post.create(
		title:  Faker::Lorem.sentence(3),
		body: Faker::Lorem.paragraph(3, 50)
	)
end

posts = Post.all

posts.each do |post|
	5.times do
		post.comments.create(
			title:  Faker::Lorem.sentence(3),
			body: Faker::Lorem.paragraph(3, 50)
		)
	end
end