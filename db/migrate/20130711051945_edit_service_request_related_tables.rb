class EditServiceRequestRelatedTables < ActiveRecord::Migration
  def change
    drop_table :statuses
    drop_table :categories

    create_table :statuses do |t|
      t.string :name
      t.integer :service_request_id
    end

    create_table :categories do |t|
      t.string :name
      t.integer :service_request_id
    end
  end
end
