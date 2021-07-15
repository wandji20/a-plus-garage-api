class CreateRearLights < ActiveRecord::Migration[6.1]
  def change
    create_table :rear_lights do |t|

      t.timestamps
    end
  end
end
