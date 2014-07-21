# == Schema Information
#
# Table name: assets
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  image       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string(255)
#

class Asset < ActiveRecord::Base
  attr_accessible :image, :title, :description, :remove_image, :image_cache

  mount_uploader :image, AssetUploader

  validates :title,
            presence: true,
            length: { in: 3..120 }

  validates :description,
            presence: true,
            length: { in: 5..255 }

  validates :image,
            presence: true


  has_many :assetable_assets
  has_many :assetable_media_galleries, through: :assetable_assets, source: :assetable, source_type: 'MediaGallery'
  has_many :assetable_articles, through: :assetable_assets, source: :assetable, source_type: 'Article'
  has_many :assetable_static_pages, through: :assetable_assets, source: :assetable, source_type: 'StaticPage'
  has_many :assetable_users, through: :assetable_assets, source: :assetable, source_type: 'User'
end
