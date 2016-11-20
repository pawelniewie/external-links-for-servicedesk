class DropColorFromServiceLinks < ActiveRecord::Migration[5.0]
  def change
    remove_column :service_links, :color
  end
end
