class JwtTokenIdNotNullInServiceLinks < ActiveRecord::Migration[5.0]
  def change
    change_column_null :service_links, :jwt_token_id, false
  end
end
