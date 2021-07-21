class AddDetailsToPart < ActiveRecord::Migration[6.1]
  def change
    add_column :parts, :count, :integer
  end
end
