class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest

  has_many :user_animes
  has_many :animes, through: :user_animes
  has_secure_password
end
