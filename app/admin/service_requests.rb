ActiveAdmin.register ServiceRequest do
  
  filter :id
  filter :resident
  filter :administrator
  filter :subject
  filter :body
  filter :category
  filter :status
  filter :updated_at
  filter :created_at
  
  index do |service_request|
    column :id
    column :resident
    column :created_at
    actions
  end
  
  show do |service_request|
    attributes_table do
      row :id
      row :resident
      row :administrator
      row :created_at
    end
  end
end