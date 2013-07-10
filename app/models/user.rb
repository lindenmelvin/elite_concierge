class User < ActiveRecord::Base
  has_many :service_requests

  devise :database_authenticatable, :token_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :time_zone
  
  before_save :ensure_authentication_token
  
  validates_presence_of :first_name, :last_name, :email
  
  def to_s
    return "#{first_name} #{last_name}"
  end
  
end