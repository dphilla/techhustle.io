class Connection < ApplicationRecord
  has_many :contact_points
  has_many :notes
  has_many :user_connections
  has_many :user, through: :user_connections
end
