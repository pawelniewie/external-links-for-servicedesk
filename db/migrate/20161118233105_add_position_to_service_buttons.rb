class AddPositionToServiceButtons < ActiveRecord::Migration[5.0]
  def change
    add_column :service_buttons, :position, :integer
    execute <<-SQL.strip_heredoc
      UPDATE service_links SET position=id
    SQL
    change_column_null :service_buttons, :position, false
  end
end
