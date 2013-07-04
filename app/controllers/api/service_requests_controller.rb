class Api::ServiceRequestsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def create
    ServiceRequest.create!(params[:service_request])
  end
  
end