class AddSlugIndexToStaticPages < ActiveRecord::Migration
  add_index :static_pages, :slug
end
