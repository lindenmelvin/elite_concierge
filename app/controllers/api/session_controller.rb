class Api::SessionsController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token
  
  def create
    resource = User.find_for_database_authentication(:email => params[:user][:email])
    
    return user_not_found unless resource

    if resource.valid_password?(params[:user][:password])
      sign_in(resource)
      current_user.save
      resource.ensure_authentication_token!
      render :json => { :success => true, :id => resource.id, :authentication_token => resource.authentication_token, :email => resource.email, :first_name => resource.first_name, :last_name => resource.last_name }
      return
    end

    invalid_login_attempt
  end

  def destroy
    resource = User.find_for_database_authentication(:email => params[:user][:email]) rescue nil
    if resource
      resource.authentication_token = nil
      resource.save
      render :json => { :success => true }
      return
    end

    invalid_logout_attempt
  end

  protected
  
  def user_not_found
    render :json => {:success => false, :message => "No User found for email provided"}, :status => 401
  end
  
  def invalid_login_attempt
    render :json => {:success => false, :message => "Password provided is incorrect"}, :status => 401
  end

  def invalid_logout_attempt
    render :json => {:success => false, :message => "Error with your login"}, :status => 401
  end
end
