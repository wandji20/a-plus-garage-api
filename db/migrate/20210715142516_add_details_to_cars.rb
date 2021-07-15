class AddDetailsToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :fuel_rate, :integer
    add_column :cars, :horse_power, :integer
  end
end
