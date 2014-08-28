class AddIndexesToArticle < ActiveRecord::Migration
  add_index :articles, :slug
  add_index :articles, :user_id
end
