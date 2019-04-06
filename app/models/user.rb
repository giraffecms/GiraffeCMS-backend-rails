class User < ApplicationRecord
  has_secure_password
  before_save { self.email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
  LETTERS_DASHES_DIGITS_REGEX = /\A[a-z0-9\-_]+\z/i
 	validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 2, maximum: 72 }, format: { with: LETTERS_DASHES_DIGITS_REGEX }
 	validates :password, presence: true, length: { minimum: 6 }
end
