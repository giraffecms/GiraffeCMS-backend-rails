require 'rails_helper'

RSpec.describe 'createUser mutation', type: :request do
	describe 'user creation' do
		before do
			post('/graphql', params: {
			 query: create_user_mutation,
			 variables: mutation_variables(:user, input_variables)
			})
		end

		context 'when input is valid' do
			let(:input_variables) { {} }
			it 'returns code 200' do
				expect(response).to have_http_status(200)
			end

			it 'returns no errors' do
				errors = json["data"]["createUser"]["errors"]
				expect(errors).to eq([])
			end

			describe 'user data' do
				let(:username) { "title" }
				let(:email) { "email@co.de" }
				let(:input_variables) { {"username": username, "email": email} }

				it 'returns username' do
					user_name = json["data"]["createUser"]["user"]["username"]
					expect(user_name).to eq(username)
				end

				it 'returns user body' do
					user_email = json["data"]["createUser"]["user"]["email"]
					expect(user_email).to eq(email)
				end
			end

			describe 'jwt' do
				it 'returns valid token' do
					token = json["data"]["createUser"]["token"]
					id = json["data"]["createUser"]["user"]["id"]
					decoded_token = JsonWebToken.decode(token)

					expect(decoded_token["user_id"].to_s).to eq(id)
				end
			end
		end

		context 'when input is invalid' do
			context 'when username is empty' do
				let(:input_variables) { {"username": ""} }

				it 'returns errors' do
					errors = json["data"]["createUser"]["errors"]
					expect(errors).not_to be_empty
				end

				it 'does not return user' do
					user = json["data"]["createUser"]["user"]
					expect(user).to be_nil
				end
			end

			context 'when email is invalid' do
				let(:input_variables) { {"email": "dqadada"} }

				it 'returns errors' do
					errors = json["data"]["createUser"]["errors"]
					expect(errors).not_to be_empty
				end

				it 'does not return user' do
					user = json["data"]["createUser"]["user"]
					expect(user).to be_nil
				end
			end

			context 'when password is invalid' do
				let(:input_variables) { {"password": "d"} }

				it 'returns errors' do
					errors = json["data"]["createUser"]["errors"]
					expect(errors).not_to be_empty
				end

				it 'does not return user' do
					user = json["data"]["createUser"]["user"]
					expect(user).to be_nil
				end
			end
		end
	end
end