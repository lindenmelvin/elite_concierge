class Api::ServiceRequestsController < ApplicationController
  
  def create
    ServiceRequest.create!(params)
  end
  
end