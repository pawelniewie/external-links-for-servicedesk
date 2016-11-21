class AddEmailToJwtUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :jwt_users, :email, :varchar
  end
end
