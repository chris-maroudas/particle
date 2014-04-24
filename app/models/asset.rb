class Asset < ActiveRecord::Base
  attr_accessible :image, :title, :remove_image, :image_cache

  mount_uploader :image, AssetUploader

end
