class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.integer :menu_id
      t.integer :node_type_id
      t.integer :position
      t.string :name
      t.string :optional_field

      t.timestamps
    end
  end
end
