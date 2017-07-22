class CreateContactPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_points do |t|
      t.date :date
      t.text :location
      t.text :event
      t.text :description

      t.timestamps
    end
  end
end
