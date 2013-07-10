ActiveAdmin.register User do
  
  filter :id
  filter :first_name
  filter :last_name
  filter :email
  filter :created_at
  
  index do |user|
    column :id
    column :first_name
    column :last_name
    column :email
    column :created_at
  end
  
end