class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 2, maximum: 100 }
	validates :body, presence: true
end
