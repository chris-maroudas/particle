class AddIndexToCategories < ActiveRecord::Migration
  add_index :categories, :slug
end
