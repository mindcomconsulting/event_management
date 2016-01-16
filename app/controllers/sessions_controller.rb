class SessionsController < Devise::SessionsController

	def new
	  super
	end

	def create
		puts "00000000000000000000000000000000000000000000000000000"
	  self.resource = warden.authenticate!(auth_options)
	    set_flash_message(:notice, :signed_in) if is_navigational_format?
	    sign_in(resource_name, resource)
	    if !session[:return_to].blank?
		puts "1111111111111111111111111111111111111111111111111111111"

	      redirect_to session[:return_to]
	      session[:return_to] = nil
	    else
		puts "22222222222222222222222222222222222222222222222222222222"
		puts params
		puts "22222222222222222222222222222222222222222222222222222222"
	      #respond_with resource, :location => after_sign_in_path_for(resource)
	      redirect_to :controller=>'welcomes',:action=>'user'
	    end
	end

end
