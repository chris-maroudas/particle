class Asset < ActiveRecord::Base
  attr_accessible :image, :title

  mount_uploader :image, AssetUploader

end
