class ChangeContactPoint < ActiveRecord::Migration[5.1]
  def change

    rename_table :contact_points, :interactions

  end
end
