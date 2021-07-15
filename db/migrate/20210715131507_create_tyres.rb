class CreateTyres < ActiveRecord::Migration[6.1]
  def change
    create_table :tyres do |t|

      t.timestamps
    end
  end
end
