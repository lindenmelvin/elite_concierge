class EditServiceRequests < ActiveRecord::Migration
  def up
    drop_table :service_requests
    
    create_table(:service_requests) do |t|
      t.string :subject
      t.text :body
      t.integer :user_id
      t.integer :category_id
      t.integer :status_id
      t.timestamps
    end

    add_index :service_requests, :user_id
  end
  
  def down
    drop_table :service_requests
  end
end
