class AddBasicInformationToServiceRequests < ActiveRecord::Migration
  def change
    add_column :service_requests, :status, :string
    add_column :service_requests, :category, :string
    add_column :service_requests, :responder, :string
  end
end
