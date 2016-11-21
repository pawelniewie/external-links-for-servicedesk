class JwtTokenIdNotNullInServiceButtons < ActiveRecord::Migration[5.0]
  def change
    change_column_null :service_buttons, :jwt_token_id, false
  end
end
