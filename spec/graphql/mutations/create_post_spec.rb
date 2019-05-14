require 'rails_helper'

RSpec.describe 'createPost mutation', type: :request do
	describe 'post creation' do
		before do
			post('/graphql', params: {
			 query: create_post_mutation,
			 variables: mutation_variables(:post, input_variables),
			}, headers: headers)
		end

		context 'when user is logged' do
			let(:headers) { valid_auth_headers }
			let(:input_variables) { {} }

			context 'when user is admin' do
				let!(:user) { create(:admin) }

				context 'when input is valid' do

					it 'returns no errors' do
						errors = json["data"]["createPost"]["errors"]
						expect(errors).to eq([])
					end

					describe 'post data' do
						let(:title) { "title" }
						let(:body) { "body" }
						let(:input_variables) { {"title": title, "body": body} }

						it 'returns post title' do
							post_title = json["data"]["createPost"]["post"]["title"]
							expect(post_title).to eq(title)
						end

						it 'returns post body' do
							post_body = json["data"]["createPost"]["post"]["body"]
							expect(post_body).to eq(body)
						end
					end
				end

				context 'when input is invalid' do
					context 'when title is empty' do
						let(:input_variables) { {"title": ""} }

						it 'returns errors' do
							errors = json["data"]["createPost"]["errors"]
							expect(errors).not_to be_empty
						end

						it 'does not return post' do
							post = json["data"]["createPost"]["post"]
							expect(post).to be_nil
						end
					end

					context 'when body is empty' do
						let(:input_variables) { {"body": ""} }

						it 'returns errors' do
							errors = json["data"]["createPost"]["errors"]
							expect(errors).not_to be_empty
						end

						it 'does not return post' do
							post = json["data"]["createPost"]["post"]
							expect(post).to be_nil
						end
					end
				end
			end

			context 'when user is not admin' do
				let!(:user) { create(:user) }

				it 'returns error' do
					errors = json["data"]["createPost"]["errors"]
					expect(errors).not_to eq("You are not allowed to create posts")
				end

				it 'does not return post' do
					post = json["data"]["createPost"]["post"]
					expect(post).to be_nil
				end
			end
		end

		context 'when user is not logged' do
			let(:input_variables) { {} }

			it 'returns error' do
				errors = json["data"]["createPost"]["errors"]
				expect(errors).not_to eq("You are not allowed to create posts")
			end

			it 'does not return post' do
				post = json["data"]["createPost"]["post"]
				expect(post).to be_nil
			end
		end
	end
end