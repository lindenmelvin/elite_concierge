class ServiceRequest < ActiveRecord::Base
  belongs_to :resident, :foreign_key => :user_id
  belongs_to :responder, :foreign_key => :user_id
  belongs_to :category
  belongs_to :status
  attr_accessible :body, :subject, :user_id, :status_id, :category_id, :responder
end