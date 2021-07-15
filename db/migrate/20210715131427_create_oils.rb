class CreateOils < ActiveRecord::Migration[6.1]
  def change
    create_table :oils do |t|

      t.timestamps
    end
  end
end
