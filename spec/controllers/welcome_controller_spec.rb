require 'rails_helper.rb'

describe WelcomeController do    
	it "renders the :index view" do
		get :index            
		expect(response.body).to include("PLUTO - Financial App")
	end

	it "renders the :home view" do
		@request.session[:user_id] = 1
		get :home
		expect(response.body).to include("Bem vindo ao PLUTO - Financial App")
	end
end
