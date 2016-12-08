require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
#    before(:each) do
#        @user          = User.new
#        @user.name     = "Bruno Casado"
#        @user.email    = "brncasado@gmail.com"
#        @user.password = "1234"
#        @user.save
#        @user.login
#        
#        puts "Teste"
#    end
    describe "GET index" do
        it "renders the index template" do
            @request.session[:user_id] = 1
            get :index
            expect(response).to render_template("index")
            expect(response.body).to include("Saldo")
            expect(response.body).to include("Excluir")
        end
    end

    describe "POST #create" do 
        it "shoud return O campo 'Nome' deve ser preenchido" do
            @request.session[:user_id] = 1
            post :create, account: {name: '', balance: 10.0, user_id: 1}
            expect( subject.request.flash[:notice] ).to include("O campo 'Nome' deve ser preenchido")
        end

        it "shoud return Salvo com sucesso e Nome da conta já utilizado" do
            @request.session[:user_id] = 1
            post :create, account: {name: 'Visa', balance: 10.0, user_id: 1}
            expect( subject.request.flash[:notice] ).to include("Salvo com sucesso")

            post :create, account: {name: 'Visa', balance: 10.0, user_id: 1}
            expect( subject.request.flash[:notice] ).to include("Nome da conta já utilizado")
        end

        it "shoud return O campo 'Saldo' deve ser preenchido" do
            @request.session[:user_id] = 1
            post :create, account: {name: 'Visa', balance: '', user_id: 1}
            expect( subject.request.flash[:notice] ).to include("O campo 'Saldo' deve ser preenchido")
        end
    end
   
end
