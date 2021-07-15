class CreateFuelPumps < ActiveRecord::Migration[6.1]
  def change
    create_table :fuel_pumps do |t|

      t.timestamps
    end
  end
end
