class Connection < ApplicationRecord
  has_many :interactions
  has_many :notes
  has_many :user_connections
  has_many :user, through: :user_connections
end
