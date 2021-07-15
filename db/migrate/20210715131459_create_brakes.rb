class CreateBrakes < ActiveRecord::Migration[6.1]
  def change
    create_table :brakes do |t|

      t.timestamps
    end
  end
end
