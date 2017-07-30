class RemoveConnectionFromRelationships < ActiveRecord::Migration[5.1]
  def change
    remove_column :relationships, :connection_id, :bigint
  end
end
