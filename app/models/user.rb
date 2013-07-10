class User < ActiveRecord::Base
  has_many :service_requests

  devise :database_authenticatable, :token_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  
  before_save :ensure_authentication_token
  
  def to_s
    return "#{first_name} #{last_name}"
  end
  
end