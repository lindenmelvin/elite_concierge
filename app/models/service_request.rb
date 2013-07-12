class ServiceRequest < ActiveRecord::Base
  belongs_to :resident
  belongs_to :administrator
  belongs_to :category
  belongs_to :status
  attr_accessible :body, :subject, :resident_id, :administrator_id, :status_id, :category_id, :responder
end