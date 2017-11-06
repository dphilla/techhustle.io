class AddDefaultRelationshipToConnection < ActiveRecord::Migration[5.1]
  def change
    change_column :connections, :relationship_id, :integer, :default => Relationship.first.id
  end
end
