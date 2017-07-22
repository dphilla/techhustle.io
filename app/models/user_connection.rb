class UserConnection < ApplicationRecord
  belongs_to :users
  belongs_to :connections
end
