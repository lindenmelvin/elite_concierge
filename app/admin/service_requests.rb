ActiveAdmin.register ServiceRequest do
  
  filter :id
  filter :resident
  filter :administrator
  filter :subject
  filter :body
  filter :updated_at
  filter :created_at
  
  index do |service_request|
    column :id
    column("Reqester") do |service_request|
      span service_request.resident.name
    end
    column("Responder") do |service_request|
      span service_request.administrator.name
    end
    column("Category") do |service_request|
      span service_request.service_request_category
    end
    column("Status") do |service_request|
      span service_request.service_request_status
    end
    column :created_at
    actions
  end
  
  show do |service_request|
    attributes_table do
      row :id
      row :resident
      row :administrator
      row :service_request_category
      row :service_request_status
      row :created_at
    end
  end
end