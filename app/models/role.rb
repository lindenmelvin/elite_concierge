class Role < ActiveRecord::Base
  has_many :user, :through => :roles_users
  has_many :roles_users
  attr_accessible :name
end