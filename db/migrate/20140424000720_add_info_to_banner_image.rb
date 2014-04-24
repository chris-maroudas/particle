class AddInfoToBannerImage < ActiveRecord::Migration
  def change
    add_column :banner_images, :title, :string
    add_column :banner_images, :caption, :string
  end
end
