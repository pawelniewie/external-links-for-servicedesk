class CreateServiceLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :service_links do |t|
      t.text :label
      t.text :href
      t.text :color

      t.timestamps
    end
  end
end
