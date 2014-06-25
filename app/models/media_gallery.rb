# == Schema Information
#
# Table name: media_galleries
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MediaGallery < ActiveRecord::Base
  attr_accessible :title, :asset_ids

  has_many :assetable_assets, as: :assetable
  has_many :assets, through: :assetable_assets

end
