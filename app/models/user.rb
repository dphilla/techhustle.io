class User < ApplicationRecord
  has_secure_password
  has_many :user_connections
  has_many :connections, through: :user_connections

  validates :username, presence: true, uniqueness: true
  enum role: ["default", "admin"]
end
