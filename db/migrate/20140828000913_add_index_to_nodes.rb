class AddIndexToNodes < ActiveRecord::Migration
  add_index :nodes, [:menu_id, :node_type_id]
end
