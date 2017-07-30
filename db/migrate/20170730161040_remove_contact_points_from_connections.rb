class RemoveContactPointsFromConnections < ActiveRecord::Migration[5.1]
  def change
    remove_column :connections, :contact_point_id, :bigint
  end
end
