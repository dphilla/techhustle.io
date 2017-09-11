class Connection < ApplicationRecord
  has_many :interactions, dependent: :destroy
  has_many :notes
  has_many :user_connections, dependent: :destroy
  has_many :users, through: :user_connections

end
