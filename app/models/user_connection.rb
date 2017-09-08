class UserConnection < ApplicationRecord
  belongs_to :user
  belongs_to :connection
end
