class AddResidentAndAdministratorsToServiceRequests < ActiveRecord::Migration
  def up
    add_column :service_requests, :resident_id, :integer
    add_column :service_requests, :administrator_id, :integer
    remove_column :service_requests, :user_id
  end

  def down
    remove_column :service_requests, :resident_id
    remove_column :service_requests, :administrator_id
    add_column :service_requests, :user_id, :integer
  end
end
