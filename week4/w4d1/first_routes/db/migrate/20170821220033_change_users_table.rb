class ChangeUsersTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, [:name, :email]
    add_column :users, :username, :string, presence: true

    add_index :users, :username, unique: true
  end
end
