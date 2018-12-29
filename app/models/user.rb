class User < ApplicationRecord
  has_many :slangs
  has_many :likes
  has_many :liked_slangs, through: :likes, source: :slang

  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
