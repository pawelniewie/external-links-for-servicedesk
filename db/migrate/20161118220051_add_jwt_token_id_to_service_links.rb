class AddJwtTokenIdToServiceLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :service_links, :jwt_token_id, :integer
    add_foreign_key :service_links, :jwt_tokens
    add_index :service_links, :jwt_token_id
  end
end
