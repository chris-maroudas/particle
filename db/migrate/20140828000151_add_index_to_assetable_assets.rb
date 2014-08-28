class AddIndexToAssetableAssets < ActiveRecord::Migration
  add_index :assetable_assets, [:assetable_id, :asset_id]
end
