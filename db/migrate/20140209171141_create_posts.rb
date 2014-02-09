class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :author_id
      t.boolean :flagged, default: false
      t.timestamps
    end
  end
end
