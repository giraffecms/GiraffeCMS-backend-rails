require 'rails_helper'

RSpec.describe 'updatePost mutation', type: :request do
	describe 'post update' do
		before do
			post('/graphql', params: {
			 query: create_comment_mutation,
			 variables: input_variables,
			}, headers: headers)
		end

		let(:post) { create(:post) }
		let(:post_id) { post.id }
		let(:input_variables) { "post": post_id, "title": title }
		let(:title) { "a valid title" }

		context 'when user is logged' do
			let(:headers) { valid_auth_headers }

			context 'when user is admin' do
				let(:user) { create(:admin) }

				context 'when input is valid' do
					it 'updates post' do
						post_title = json["data"]["createPost"]["post"]["title"]
						expect(post_title).to eq(title)
					end

					it 'returns no errors' do
						errors = json["data"]["updatePost"]["errors"]
						expect(errors).to eq([])
					end
				end

				context 'when input is invalid' do
					context 'when data is invalid' do
						let(:title) { "" }

						it 'does not return post' do
							post = json["data"]["createPost"]["post"]
							expect(post).to be_nil
						end

						it 'returns error' do
							errors = json["data"]["updatePost"]["errors"]
							expect(errors).to eq(['Invalid input'])
						end
					end

					context 'when post id is invalid' do
						let(:post_id) { 0 }

						it 'does not return post' do
							post = json["data"]["createPost"]["post"]
							expect(post).to be_nil
						end

						it 'returns error' do
							errors = json["data"]["updatePost"]["errors"]
							expect(errors).to eq(['ID is invalid'])
						end
					end
				end
			end

			context 'when user is not admin' do
				let(:user) { create(:user) }

				it 'does not return post' do
					post = json["data"]["createPost"]["post"]
					expect(post).to be_nil
				end

				it 'returns error' do
					errors = json["data"]["updatePost"]["errors"]
					expect(errors).to eq(['You dont have enough permissions to do that'])
				end
			end
		end

		context 'when user is not logged' do
			let(:headers) { {} }

			it 'does not return post' do
				post = json["data"]["createPost"]["post"]
				expect(post).to be_nil
			end

			it 'returns error' do
				errors = json["data"]["updatePost"]["errors"]
				expect(errors).to eq(['You dont have enough permissions to do that'])
			end
		end
	end
end