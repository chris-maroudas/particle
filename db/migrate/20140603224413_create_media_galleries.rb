class CreateMediaGalleries < ActiveRecord::Migration
  def change
    create_table :media_galleries do |t|
      t.string :title

      t.timestamps
    end
  end
end
