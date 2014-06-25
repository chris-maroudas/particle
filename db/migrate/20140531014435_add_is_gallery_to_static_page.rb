class AddIsGalleryToStaticPage < ActiveRecord::Migration
  def change
    add_column :static_pages, :is_gallery, :boolean
  end
end
