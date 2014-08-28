class AddIndexToRatings < ActiveRecord::Migration
  add_index :ratings, [:article_id, :user_id]
end
