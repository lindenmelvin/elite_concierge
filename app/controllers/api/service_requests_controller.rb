class ServiceRequestionsController < ApplicationController
  
  def create
    ServiceRequest.create!(params)
  end
  
end