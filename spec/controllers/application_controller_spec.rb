require 'rails_helper.rb'

describe ApplicationController do    
    describe "GET #password" do
        describe UsersController do
            it "should be redirect to the :index view" do                
                get :password         
                expect(response).to redirect_to("/")
            end
        end
    end
end
