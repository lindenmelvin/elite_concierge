class ServiceRequestsController < ApplicationController
  
  def index
    @service_requests = ServiceRequest.all
  end
  
end