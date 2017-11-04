class ChangeRefreshTokenToToken < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :refresh_token, :token
  end
end
