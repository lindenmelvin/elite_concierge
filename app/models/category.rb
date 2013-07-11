class Category < ActiveRecord::Base
  has_many :service_requests
  
  attr_accessible :name
end