# == Schema Information
#
# Table name: assets
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Asset < ActiveRecord::Base
  attr_accessible :image, :title, :remove_image, :image_cache

  mount_uploader :image, AssetUploader

end
