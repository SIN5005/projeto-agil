require 'rails_helper.rb'

describe UsersController do    
    def change_pass(pass, confir, msg)
        @request.session[:user_id] = 1
        post :change_password, {newpass: pass, confirmation: confir}
        expect( subject.request.flash[:notice] ).to include(msg)
    end


    describe "GET #index" do
        it "renders the :index view" do
            get :index
            expect(response.body).to include("Nome")
            expect(response.body).to include("E-mail")
            expect(response.body).to include("Senha")
            expect(response.body).to include("Confirmação de Senha")
        end
    end

    describe "POST #create" do 
        it "shoud return O campo nome deve ser preenchido." do
            post :create, user: {name: ''}
            expect( subject.request.flash[:notice] ).to include("O campo nome deve ser preenchido.")
        end

        it "shoud return O campo e-mail é obrigatório." do
            post :create, user: {name: 'Herik Lima', email: ''}    
            expect( subject.request.flash[:notice] ).to include("O campo e-mail é obrigatório.")
        end

        it "shoud return A senha deve conter pelo menos 4 caracteres." do
            post :create, user: {name: 'Herik Lima', email: 'heriklyma@hotmail.com', password: ''}
            expect( subject.request.flash[:notice] ).to include("A senha deve conter pelo menos 4 caracteres.")
        end

        it "shoud return Senha e confirmação não conferem." do
            post :create, user: {name: 'Herik Lima', email: 'heriklyma@hotmail.com', password: '1234', password_confirmation: '123'}
            expect( subject.request.flash[:notice] ).to include("Senha e confirmação não conferem.")
        end

        it "shoud return Salvo com sucesso. e E-mail já cadastrado." do
            post :create, user: {name: 'Herik Lima', email: 'heriklyma@hotmail.com', password: '1234', password_confirmation: '1234'}
            expect( subject.request.flash[:notice] ).to include("Salvo com sucesso.")

            post :create, user: {name: 'Herik Lima', email: 'heriklyma@hotmail.com', password: '1234', password_confirmation: '1234'}
            expect( subject.request.flash[:notice] ).to include("E-mail já cadastrado.")
        end
    end

    describe "GET #password" do
        it "renders the :password view" do
            @request.session[:user_id] = 1
            get :password            
            expect(response.body).to include("Confirmação")
            expect(response.body).to include("Nova Senha");            
        end
    end

    describe "POST #change_password" do 
        it "shoud return A senha esta diferente da confirmação de senha." do
            change_pass('1234', '12345', 'A senha esta diferente da confirmação de senha')
        end
    
        it "shoud return A senha deve conter 4 caracteres ou mais." do
            change_pass('123', '123', 'A senha deve conter 4 caracteres ou mais')
        end        
    

        it "shoud return Salvo com sucesso." do
            user = User.new
            user.name = "Test"
            user.password = "1234"
            user.email = "test@test.com"
            user.save            
            @request.session[:user_id] = 1
            post :change_password, {newpass: '123456', confirmation: '123456'}
            expect( subject.request.flash[:notice] ).to include("Salvo com sucesso")
        end        
    end    


    describe "GET #logout" do
        it "should be redirect to the :index view" do
            @request.session[:user_id] = 1
            get :logout
            expect(response).to redirect_to("/")
        end
    end

    describe "GET #forgot_password" do
        it "should render :forgot_password view" do            
            get :forgot_password            
            expect(response.body).to include("Esqueci minha Senha")
        end
    end
end
