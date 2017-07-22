class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.string :status
      
      t.timestamps
    end
  end
end
