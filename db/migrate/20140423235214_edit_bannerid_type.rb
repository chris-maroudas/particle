class EditBanneridType < ActiveRecord::Migration
  def up
    remove_column :banner_images, :banner_id
    add_column :banner_images, :banner_id, :integer
  end

  def down
  end
end
