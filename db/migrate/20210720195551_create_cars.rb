class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :make
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
