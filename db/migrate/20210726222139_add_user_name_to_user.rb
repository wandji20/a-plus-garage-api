class AddUserNameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_name, :string
  end
end
