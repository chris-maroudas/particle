class AddArticleidToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :article_id, :integer
  end
end
