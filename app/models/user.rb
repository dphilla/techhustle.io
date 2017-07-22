class User < ApplicationRecord
  has_many :user_connections
  has_many :connections, through: :user_connections
end
