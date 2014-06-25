# == Schema Information
#
# Table name: assetable_assets
#
#  id             :integer          not null, primary key
#  assetable_id   :integer
#  asset_id       :integer
#  assetable_type :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class AssetableAsset < ActiveRecord::Base
  attr_accessible :asset_id, :assetable_id, :assetable_type

  belongs_to :assetable, polymorphic: true
  belongs_to :asset

end
