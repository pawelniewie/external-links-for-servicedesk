class AddProjectIdToServiceButtons < ActiveRecord::Migration[5.0]
  def change
    add_column :service_buttons, :project_id, :integer, null: false
  end
end
