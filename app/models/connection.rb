class Connection < ApplicationRecord
  has_many :interactions
  has_many :notes
  has_many :user_connections, dependent: :destroy
  has_many :users, through: :user_connections
end
