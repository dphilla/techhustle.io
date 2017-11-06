class RemoveDefaultColumnFromConnections < ActiveRecord::Migration[5.1]
  def change
    change_column :connections, :relationship_id, :integer, :default => false
  end
end
