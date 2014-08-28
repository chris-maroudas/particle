class AddIndexesToArticleCategories < ActiveRecord::Migration
  add_index :articles_categories, [:article_id, :category_id]
end
