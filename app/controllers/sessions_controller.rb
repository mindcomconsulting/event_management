class SessionsController < Devise::SessionsController
  before_action :authenticate_user!
	
	def home
	end

	def new
	  super
	end

	def create
	  self.resource = warden.authenticate!(auth_options)
	    set_flash_message(:notice, :signed_in) if is_navigational_format?
	    sign_in(resource_name, resource)
	    if !session[:return_to].blank?

	      redirect_to session[:return_to]
	      session[:return_to] = nil
	    else
	      #respond_with resource, :location => after_sign_in_path_for(resource)
	      redirect_to :controller=>'events',:action=>'index'
	    end
	end

	def destroy
		sign_out current_user
		redirect_to :controller=>'welcomes',:action=>'home'
	end

end
