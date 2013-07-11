ActiveAdmin.register User do
  
  scope :all do |users|
    users
  end
  
  scope :administrators do |users|
    Role.administrators
  end
  
  scope :residents do |users|
    Role.residents
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
    column :roles do |user|
      span user.roles.collect { |role| role.name }
    end
    actions
  end
  
  show do |user|
    attributes_table do
      row :id
      row :first_name
      row :last_name
      row :email
      row :roles do |user|
        span user.roles.collect { |role| role.name }
      end
      row :created_at
      row :updated_at
    end
  end
  
  form do |f|
    f.inputs :basics do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :roles
    end

    f.actions
  end
  
end