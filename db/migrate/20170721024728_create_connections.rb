class CreateConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :connections do |t|
      t.text :name
      t.datetime :initial_meet
      t.text :organization

      t.timestamps
    end
  end
end
