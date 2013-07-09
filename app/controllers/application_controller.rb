class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery
  
  def after_sign_out_path_for(resource)
    return '/login'
  end
  
end
