require 'rails_helper'

RSpec.describe 'createComment mutation', type: :request do
	describe 'comment creation' do
		before do
			post('/graphql', params: {
			 query: create_comment_mutation,
			 variables: input_variables,
			}, headers: headers)
		end

		let!(:post_id) { create(:post).id }
		let(:input_variables) { {"post": post_id, "title": title, "body": body} }
		let(:title) { "a valid title" }
		let(:body) { "a valid body" }

		context 'when user is logged' do
			let!(:user) { create(:user) }
			let(:headers) { valid_auth_headers }

			context 'when input is valid' do
				it 'returns no errors' do
					errors = json["data"]["createComment"]["errors"]
					expect(errors).to eq([])
				end

				it 'returns comment data' do
					comment_title = json["data"]["createComment"]["comment"]["title"]
					comment_body = json["data"]["createComment"]["comment"]["body"]
					expect(comment_title).to eq(title)
					expect(comment_body).to eq(body)
				end

				describe 'associations' do
					it 'returns valid author data' do
						author = json["data"]["createComment"]["comment"]["author"]["username"]
						expect(author).to eq(user.username)
					end

					it 'returns valid post' do
						post = json["data"]["createComment"]["comment"]["post"]["id"]
						expect(post).to eq(post_id.to_s)
					end
				end
			end

			context 'when input is invalid' do
				let(:title) { "" }
				let(:body) { "" }

				it 'returns errors' do
					errors = json["data"]["createComment"]["errors"]
					expect(errors).not_to be_empty
				end

				it 'does not return comment' do
					comment = json["data"]["createComment"]["comment"]
					expect(comment).to be_nil
				end
			end
		end

		context 'when user is not logged' do
			let(:headers) { {} }

			it 'returns errors' do
				errors = json["data"]["createComment"]["errors"]
				expect(errors).to eq(["You must be logged in to create comment"])
			end

			it 'does not return comment' do
				comment = json["data"]["createComment"]["comment"]
				expect(comment).to be_nil
			end
		end
	end
end