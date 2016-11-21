class DropColorFromServiceButtons < ActiveRecord::Migration[5.0]
  def change
    remove_column :service_buttons, :color
  end
end
