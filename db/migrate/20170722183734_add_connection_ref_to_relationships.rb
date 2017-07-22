class AddConnectionRefToRelationships < ActiveRecord::Migration[5.1]
  def change
    add_reference :relationships, :connection, foreign_key: true
  end
end
