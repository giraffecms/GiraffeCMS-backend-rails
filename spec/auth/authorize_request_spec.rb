require 'rails_helper'

RSpec.describe AuthorizeRequest do
	let(:user) { create(:user) }
	let(:payload) { {user_id: user.id } }
	let(:response) { AuthorizeRequest.call(headers) }

	context 'token present' do
		let(:headers) { { "Authorization" => token } }

		context 'token is valid' do
			let(:token) { JsonWebToken.encode(payload) }

			it 'returns user' do
				expect(response).to eq(user)
			end
		end

		context 'token is invalid' do
			describe 'outdated token' do
				let(:token) { JsonWebToken.encode(payload, 5.minutes.ago) }

				it 'returns false' do
					expect{response}.to raise_error(JWT::ExpiredSignature)
				end
			end

			describe 'fake token' do
				let(:token) { '2hr283hr923hbf93h29tg39g4h3984gh8348hg932ht4' }

				it 'returns false' do
					expect{response}.to raise_error(JWT::DecodeError)
				end
			end
		end
	end

	context 'token not present' do
		let(:headers) { {} }

		it 'returns false' do
			expect(response).to be_falsey
		end
	end
end
