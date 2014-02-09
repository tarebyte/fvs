class AddAuthorAndContentToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
    add_column :posts, :content, :string
    add_column :posts, :author_id, :integer
    add_column :posts, :flagged, :boolean, default: false
  end
end
