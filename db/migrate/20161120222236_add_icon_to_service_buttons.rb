class AddIconToServiceButtons < ActiveRecord::Migration[5.0]
  def change
    add_column :service_buttons, :icon, :text
  end
end
