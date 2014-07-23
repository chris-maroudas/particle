# == Schema Information
#
# Table name: media_galleries
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string(255)
#

class MediaGallery < ActiveRecord::Base
  attr_accessible :title, :asset_ids

  has_many :assetable_assets, as: :assetable, dependent: :destroy
  has_many :assets, through: :assetable_assets

  extend FriendlyId
  friendly_id :title, use: :slugged


  def should_generate_new_friendly_id?
    new_record?
  end

end
