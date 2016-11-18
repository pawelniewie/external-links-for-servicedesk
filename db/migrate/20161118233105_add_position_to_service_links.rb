class AddPositionToServiceLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :service_links, :position, :integer
    execute <<-SQL.strip_heredoc
      UPDATE service_links SET position=id
    SQL
    change_column_null :service_links, :position, false
  end
end
