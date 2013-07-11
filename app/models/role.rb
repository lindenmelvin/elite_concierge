class Role < ActiveRecord::Base
  has_many :users, :through => :roles_users
  has_many :roles_users
  
  attr_accessible :name
  
  def self.residents
    self.find_by_name('resident').users
  end
  
  def self.administrators
    self.find_by_name('admin').users
  end
end