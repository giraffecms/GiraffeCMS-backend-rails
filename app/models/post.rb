class Post < ApplicationRecord
	has_and_belongs_to_many :authors, :class_name => "User"
	has_many :comments, dependent: :destroy

	validates :title, presence: true, length: { maximum: 72 }
	validates :body, presence: true
end
