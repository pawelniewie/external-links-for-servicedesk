class AddProjectIdToServiceLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :service_links, :project_id, :integer, null: false
  end
end
