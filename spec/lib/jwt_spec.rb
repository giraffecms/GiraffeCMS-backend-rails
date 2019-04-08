require 'rails_helper'
require_relative '../../lib/json_web_token.rb'

RSpec.describe JsonWebToken do
	let!(:token) { JsonWebToken.encode(payload) }

	describe 'token encoding' do
		let(:payload) { {user_id: 1} }
		it 'encodes payload' do
			expect(token).not_to be_nil
		end
	end
end
