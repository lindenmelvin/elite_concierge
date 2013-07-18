class User < ActiveRecord::Base
  has_many :service_requests
  has_many :roles, :through => :roles_users
  has_many :roles_users

  devise :database_authenticatable, :token_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :time_zone, :role_ids, :type
  
  before_save :ensure_authentication_token
  
  validates_presence_of :first_name, :last_name, :email
  
  def name
    return "#{first_name} #{last_name}" || email || "Anonymous"
  end
  
  def administrator?
    self.type == 'Administrator'
  end
  
end