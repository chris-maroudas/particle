class ChangeUserIdInRatingToInteger < ActiveRecord::Migration
  def change
    change_column :ratings, :user_id, :integer
  end
end
