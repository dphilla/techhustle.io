class RemoveRelationshipFromConnection < ActiveRecord::Migration[5.1]
  def change
    remove_column :connections, :relationship, :string
  end
end
