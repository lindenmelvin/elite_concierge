class SessionsController < Devise::SessionsController
  def new
  end

  def destroy
    signed_out = sign_out(resource_name)
    if signed_out
      set_flash_message :notice, :signed_out
    end
    
    redirect_to '/login'
  end
end
