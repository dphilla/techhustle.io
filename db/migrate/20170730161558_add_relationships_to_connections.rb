class AddRelationshipsToConnections < ActiveRecord::Migration[5.1]
  def change
    add_column :connections, :relationship, :string
  end
end
