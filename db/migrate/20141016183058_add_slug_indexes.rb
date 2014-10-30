class AddSlugIndexes < ActiveRecord::Migration
  def change
    add_index :users, :slug
    add_index :posts, :slug
    add_index :categories ,:slug
  end
end
