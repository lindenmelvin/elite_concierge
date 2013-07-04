class CreateServiceRequests < ActiveRecord::Migration
  def change
    create_table(:service_requests) do |t|
      t.string :subject
      t.text :body
      t.integer :user_id

      t.timestamps
    end

    add_index :service_requests, :user_id
  end
end
