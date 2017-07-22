class Connection < ApplicationRecord
  belongs_to :contact_points
  belongs_to :notes
  belongs_to :relationships
  has_many :user_connections
  has many :user, through: :user_connections
end
