class Comment < ApplicationRecord
  belongs_to :post

  validates :title, presence: true, length: { minimum: 3, maximum: 56 }
  validates :body, presence: true, length: { minimum: 3, maximum: 1000 }
end
