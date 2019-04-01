require 'rails_helper'

RSpec.describe Comment, type: :model do
	it 'has a valid factory' do
		expect(build(:comment)).to be_valid
	end

	describe 'validation' do
		it { should validate_presence_of(:title) }
		it { should validate_presence_of(:body) }

		it { should validate_length_of(:title).is_at_most(56).is_at_least(3) }
		it { should validate_length_of(:body).is_at_most(1000).is_at_least(3) }
	end
	
	describe 'associations' do
		it { should belong_to(:post) }
	end
end
