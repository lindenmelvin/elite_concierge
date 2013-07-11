ActiveAdmin.register User do
  
  scope :all
  
  scope :administrators do |users|
    Administrator
  end
  
  scope :residents do |users|
    Resident
  end
  
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
    actions
  end
  
  show do |user|
    attributes_table do
      row :id
      row :first_name
      row :last_name
      row :email
      row :created_at
      row :updated_at
    end
  end
  
  form do |f|
    f.inputs :basics do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :type, :as => :select, :label => "Type", :collection => Role.all.map(&:name)
    end

    f.actions
  end
  
end