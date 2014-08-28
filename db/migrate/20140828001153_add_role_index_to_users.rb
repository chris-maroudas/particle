class AddRoleIndexToUsers < ActiveRecord::Migration
  add_index :users, :role_id
end
