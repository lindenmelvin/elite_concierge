class ServiceRequest < ActiveRecord::Base
  belongs_to :resident
  belongs_to :administrator
  belongs_to :service_request_category, :foreign_key => :category_id
  belongs_to :service_request_status, :foreign_key => :status_id
  attr_accessible :body, :subject, :resident_id, :administrator_id, :status_id, :category_id, :responder
end