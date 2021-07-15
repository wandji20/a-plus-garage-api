class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :make
      t.references :oil, null: false, foreign_key: true
      t.references :oil_filter, null: false, foreign_key: true
      t.references :brake, null: false, foreign_key: true
      t.references :rear_light, null: false, foreign_key: true
      t.references :tyre, null: false, foreign_key: true
      t.references :radiator_coolant, null: false, foreign_key: true
      t.references :fuel_pump, null: false, foreign_key: true

      t.timestamps
    end
  end
end
