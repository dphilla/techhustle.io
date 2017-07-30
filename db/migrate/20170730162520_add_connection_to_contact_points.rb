class AddConnectionToContactPoints < ActiveRecord::Migration[5.1]
  def change
    add_reference :contact_points, :connection, foreign_key: true
  end
end
