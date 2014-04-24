class AddBanneridToBannerImages < ActiveRecord::Migration
  def change
    add_column :banner_images, :banner_id, :string
  end
end
