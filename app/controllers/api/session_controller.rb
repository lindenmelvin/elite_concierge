class Api::SessionsController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token

  def create
    puts "11111111"
    resource = User.find_for_database_authentication(:email => params[:user][:email])
    puts "22222222"
    
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:user][:password])
      puts "3333333"
      
      sign_in(:user, resource)
      current_user.save
      resource.ensure_authentication_token!
      puts "44444"
      
      render :json => { :success => true, :id => resource.id, :authentication_token => resource.authentication_token, :email => resource.email }
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
  
  def invalid_login_attempt
    render :json => {:success => false, :message => "Error with your login or password"}, :status => 401
  end

  def invalid_logout_attempt
    render :json => {:success => false, :message => "Error with your login"}, :status => 401
  end
end
