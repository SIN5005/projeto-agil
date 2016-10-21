require 'rails_helper.rb'

describe UsersController do    
  it "renders the :index view" do
    get :index            
    expect(response.body).to include("Name")
    expect(response.body).to include("Email")
    expect(response.body).to include("Password")
    expect(response.body).to include("Password confirmation")    
    #expect(response).to render_template(:index)
  end  

  it "shoud save a user :create" do
  end
end
