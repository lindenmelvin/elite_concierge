ActiveAdmin.register ServiceRequest do
  
  filter :id
  filter :user
  filter :subject
  filter :body
  filter :updated_at
  filter :created_at
end