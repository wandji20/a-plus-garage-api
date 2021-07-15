class CreateOilFilters < ActiveRecord::Migration[6.1]
  def change
    create_table :oil_filters do |t|

      t.timestamps
    end
  end
end
