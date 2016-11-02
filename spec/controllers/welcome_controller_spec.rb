require 'rails_helper.rb'

describe WelcomeController do    
	it "renders the :index view" do
		get :index            
		expect(response.body).to include("PLUTO - Financial App")
	end
end
