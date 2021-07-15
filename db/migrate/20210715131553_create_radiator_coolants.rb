class CreateRadiatorCoolants < ActiveRecord::Migration[6.1]
  def change
    create_table :radiator_coolants do |t|

      t.timestamps
    end
  end
end
