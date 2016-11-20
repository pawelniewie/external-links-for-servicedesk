class AddIconToServiceLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :service_links, :icon, :text
  end
end
