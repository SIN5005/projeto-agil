class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_filter :authenticate

	def authenticate
		path = request.path
		#puts "url"
		#puts "path#{path}"
		if (not path.eql?("/")) and 
           (not path.eql?("/login")) and 
           (not path.eql?("/users")) and
		   (not path.eql?("/forgot_password")) and
		   (not path.eql?("/forgot")) and
		   (not path.eql?("/sample_email"))		   
			if session[:user_id] == nil
		        redirect_to root_path
		    end
		end
	end
end
