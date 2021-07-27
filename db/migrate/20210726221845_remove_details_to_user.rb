class RemoveDetailsToUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :userID, :string
  end
end
