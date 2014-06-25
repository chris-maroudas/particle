class CreateAssetableAssets < ActiveRecord::Migration
  def change
    create_table :assetable_assets do |t|
      t.integer :assetable_id
      t.integer :asset_id
      t.string :assetable_type

      t.timestamps
    end
  end
end
