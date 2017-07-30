class RemoveNotesFromConnections < ActiveRecord::Migration[5.1]
  def change
    remove_column :connections, :note_id, :bigint
  end
end
