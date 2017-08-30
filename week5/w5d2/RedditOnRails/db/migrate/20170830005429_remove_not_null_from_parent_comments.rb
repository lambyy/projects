class RemoveNotNullFromParentComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :parent_comment_id
    add_column :comments, :parent_comment_id, :integer
    add_index :comments, :parent_comment_id
  end
end
