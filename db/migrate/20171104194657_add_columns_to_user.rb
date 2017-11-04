class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :uid, :string
    add_column :users, :email, :string
    add_column :users, :refresh_token, :string
    add_column :users, :id_token, :string
  end
end
