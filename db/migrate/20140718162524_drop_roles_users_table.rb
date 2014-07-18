class DropRolesUsersTable < ActiveRecord::Migration
  def up
    drop_table :roles_users
  end

  def down
    create_table :roles_users
  end
end
