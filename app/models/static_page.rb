# == Schema Information
#
# Table name: static_pages
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  is_gallery :boolean
#

class StaticPage < ActiveRecord::Base
  attr_accessible :content, :slug, :title

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :assetable_assets, as: :assetable
  has_many :assets, through: :assetable_assets

end