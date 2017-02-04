class AddExpiresAtToSessions < ActiveRecord::Migration[5.0]
  def change
    add_column :sessions, :expires_at, :timestamp
  end
end
