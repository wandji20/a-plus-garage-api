class AddDetailsToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :fuel, :integer
    add_column :cars, :power, :integer
  end
end
