class AddTypeToCategoriesAndStatuses < ActiveRecord::Migration
  def up
    add_column :categories, :type, :string
    add_column :statuses, :type, :string
  end

  def down
    remove_column :categories, :type
    remove_column :statuses, :type
  end
end
