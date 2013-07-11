class CreateRoles < ActiveRecord::Migration
  def up
    create_table :roles do |t|
      t.string :name
      
      t.timestamps
    end

    create_table :roles_users, :id => false do |t|
      t.integer :user_id
      t.integer :role_id
    end

    add_index :roles_users, :user_id
    add_index :roles_users, :role_id
  end
  
  def down
    drop_table :roles
    drop_table :roles_users
  end
end
