class Banner < ActiveRecord::Base
  attr_accessible :name, :banner_image_ids

  has_many :banner_images
end
