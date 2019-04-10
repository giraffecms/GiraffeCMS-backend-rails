require 'rails_helper'
require_relative '../../lib/json_web_token.rb'

RSpec.describe JsonWebToken do
	let(:token) { JsonWebToken.encode(payload) }
	let(:decoded_token) { JsonWebToken.decode(token) }
	let(:payload) { {user_id: user_id} }
	let(:user_id) { 1 }

	it 'encodes payload' do
		expect(token).not_to be_nil
	end

	it 'decodes token' do
		expect(decoded_token["user_id"]).to eq(user_id)
	end

	describe 'validation' do
		let(:token) { JsonWebToken.encode(payload, 5.minutes.ago) }

		it 'does not decode outdated token' do
			expect{decoded_token}.to raise_error(JWT::ExpiredSignature)
		end
	end
end
