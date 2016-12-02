class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_filter :authenticate

	def authenticate
		path = request.path
		puts "url"
		puts path
		if (not path.eql?("/")) and 
           (not path.eql?("/login")) and 
           (not path.eql?("/users"))           
			if session[:user_id] == nil
		        redirect_to root_path
		    end
		end
	end
end
