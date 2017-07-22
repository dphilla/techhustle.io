class AddConnectionRefToUserConnections < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_connections, :connection, foreign_key: true
  end
end
