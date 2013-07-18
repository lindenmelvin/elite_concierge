class Api::ServiceRequestsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def create
    params[:service_request].merge!(:resident_id => current_user.id, :administrator_id => Administrator.first.id)
    if ServiceRequest.create!(params[:service_request])
      render json: { success: true }
    else
      render json: { success: false }
    end
  end
  
end