class AddUseridToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :user_id, :string
  end
end
