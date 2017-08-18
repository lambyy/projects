class CreateTaggings < ActiveRecord::Migration[5.1]
  def change
    create_table :taggings do |t|
      t.integer :tag_topic_id, null: false
      t.integer :short_url_id, null: false
      t.timestamps
    end

    add_index :taggings, [:tag_topic_id, :short_url_id]
  end
end
