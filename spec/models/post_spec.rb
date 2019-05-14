require 'rails_helper'

RSpec.describe Post, type: :model do
	it 'has a valid factory' do
		expect(build(:post)).to be_valid
	end

	describe 'validation' do
		it { should validate_presence_of(:title) }
		it { should validate_presence_of(:body) }

		it { should validate_length_of(:title).is_at_most(72) }
	end

	describe 'associations' do
		it { should have_many(:comments).dependent(:destroy) }
		it { should have_and_belong_to_many(:authors) }
	end
end
