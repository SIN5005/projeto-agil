require 'rails_helper.rb'

describe LoginController do    
    def call_post(e_mail, pass, msg)
        post :login, email: e_mail, password: pass
        expect( subject.request.flash[:notice] ).to include(msg)
    end

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
            call_post('', '1234', 'Preencha o e-mail.')
        end
        it "shoud return Preencha a senha." do
            call_post('heriklyma@hotmail.com.br', '', 'Preencha a senha.')
        end
        it "shoud return E-mail não cadastrado." do
            call_post('heriklyma@hotmail.com.br', '1234', 'E-mail não cadastrado.')
        end
        it "shoud return Senha incorreta." do
            call_post('heriklyma@hotmail.com', '123', 'Senha incorreta.')            
        end
        it "shoud return Home." do
            post :login, email: 'heriklyma@hotmail.com', password: '123456'
            expect(response).to redirect_to(:home)
        end
    end
end
