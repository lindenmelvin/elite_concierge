class UsersController < ApplicationController
  
  def index
  end
  
  def new
    @user = User.new
  end
  
  def create
    if @user = User.create!(params[:user])
      redirect_to(root_path, :notice => "User #{@user.first_name} #{@user.last_name} Created.")
    else
      render :action => :new
    end
  end
end