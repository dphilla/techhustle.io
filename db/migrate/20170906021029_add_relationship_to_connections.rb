class AddRelationshipToConnections < ActiveRecord::Migration[5.1]
  def change
    add_reference :connections, :relationship, foreign_key: true
  end
end
