class Api::ServiceRequestsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def create
    if ServiceRequest.create!(params[:service_request])
      render json: { success: true }
    else
      render json: { success: false }
    end
  end
  
end