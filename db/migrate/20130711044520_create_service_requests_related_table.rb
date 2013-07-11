class CreateServiceRequestsRelatedTable < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name
    end

    create_table :categories do |t|
      t.string :name
    end
  end
end
