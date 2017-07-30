class AddConnectionRefToNotes < ActiveRecord::Migration[5.1]
  def change
    add_reference :notes, :connection, foreign_key: true
  end
end
