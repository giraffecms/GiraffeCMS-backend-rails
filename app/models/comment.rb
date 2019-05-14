class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, foreign_key: "user_id", class_name: "User"

  validates :title, presence: true, length: { minimum: 3, maximum: 56 }
  validates :body, presence: true, length: { minimum: 3, maximum: 1000 }
end
