class AddJwtTokenIdToServiceButtons < ActiveRecord::Migration[5.0]
  def change
    add_column :service_buttons, :jwt_token_id, :integer
    add_foreign_key :service_buttons, :jwt_tokens
    add_index :service_buttons, :jwt_token_id
  end
end
