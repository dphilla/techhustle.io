class AddUserRefToUserConnections < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_connections, :user, foreign_key: true
  end
end
