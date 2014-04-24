class BannerImage < ActiveRecord::Base
  attr_accessible :image, :title, :caption, :banner_id, :remove_image, :image_cache
  mount_uploader :image, BannerImageUploader
  belongs_to :banner
end
