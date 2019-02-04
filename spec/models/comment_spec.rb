require 'rails_helper'

RSpec.describe Comment, type: :model do
	it { should validate_presence_of(:title) }
	it { should validate_presence_of(:body) }

	it { should validate_length_of(:title).is_at_most(56).is_at_least(3) }
	it { should validate_length_of(:body).is_at_most(1000).is_at_least(3) }
			
	it { should belong_to(:post) }
end
