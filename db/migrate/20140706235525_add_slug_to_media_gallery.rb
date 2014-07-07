class AddSlugToMediaGallery < ActiveRecord::Migration
  def change
    add_column :media_galleries, :slug, :string
  end
end
