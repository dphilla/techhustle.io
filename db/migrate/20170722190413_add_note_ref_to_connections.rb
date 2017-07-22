class AddNoteRefToConnections < ActiveRecord::Migration[5.1]
  def change
    add_reference :connections, :note, foreign_key: true
  end
end
