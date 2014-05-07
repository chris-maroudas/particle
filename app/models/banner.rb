# == Schema Information
#
# Table name: banners
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Banner < ActiveRecord::Base
  attr_accessible :name, :banner_image_ids

  has_many :banner_images

end
