require 'rails_helper.rb'

describe LoginController do    
    before(:each) do
        @user          = User.new
        @user.name     = "Herik Lima"
        @user.email    = "heriklyma@hotmail.com"
        @user.password = "123456"
        @user.save
    end    

    describe "GET #index" do
        it "renders the :index view" do
            get :index
            expect(response.body).to include("Email")
            expect(response.body).to include("Senha")
        end
    end

    describe "POST #login" do 
        it "shoud return Preencha o e-mail." do
            post :login, email: '', password: '1234'
            expect( subject.request.flash[:notice] ).to include("Preencha o e-mail.")
        end
        it "shoud return Preencha a senha." do
            post :login, email: 'heriklyma@hotmail.com.br', password: ''
            expect( subject.request.flash[:notice] ).to include("Preencha a senha.")
        end
        it "shoud return E-mail não cadastrado." do
            post :login, email: 'heriklyma@hotmail.com.br', password: '1234'
            expect( subject.request.flash[:notice] ).to include("E-mail não cadastrado.")
        end
        it "shoud return Senha incorreta." do
            post :login, email: 'heriklyma@hotmail.com', password: '123'
            expect( subject.request.flash[:notice] ).to include("Senha incorreta.")
        end
        it "shoud return Sucesso." do
            post :login, email: 'heriklyma@hotmail.com', password: '123456'
            expect( subject.request.flash[:notice] ).to include("Sucesso.")
        end
    end
end
