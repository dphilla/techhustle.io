class AddContactPointRefToConnections < ActiveRecord::Migration[5.1]
  def change
    add_reference :connections, :contact_point, foreign_key: true
  end
end
