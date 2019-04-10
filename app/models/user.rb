class User < ApplicationRecord
  has_secure_password

  has_and_belongs_to_many :posts

  before_save { self.email.downcase }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100 }, format: { with: URI::MailTo::EMAIL_REGEXP }
 	validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 2, maximum: 72 }, format: { with: /\A[a-zA-Z0-9]+\Z/ }
 	validates :password, presence: true, length: { minimum: 6 }
end
