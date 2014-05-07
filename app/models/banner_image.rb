# == Schema Information
#
# Table name: banner_images
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  banner_id  :integer
#  title      :string(255)
#  caption    :string(255)
#

class BannerImage < ActiveRecord::Base
  attr_accessible :image, :title, :caption, :banner_id, :remove_image, :image_cache
  mount_uploader :image, BannerImageUploader
  belongs_to :banner
end
