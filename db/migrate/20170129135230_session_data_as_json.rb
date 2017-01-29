class SessionDataAsJson < ActiveRecord::Migration[5.0]
  def change
    remove_column :sessions, :data
    add_column :sessions, :data, :jsonb
  end
end
