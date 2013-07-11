class EditServiceRequestRelatedTables < ActiveRecord::Migration
  def up
    create_table :statuses do |t|
      t.string :name
    end

    create_table :categories do |t|
      t.string :name
    end
  end
  
  def down
    drop_table :statuses
    drop_table :categories
  end
end
