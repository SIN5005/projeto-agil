require 'rails_helper.rb'

describe UsersController do    
  describe "GET #index" do
    it "renders the :index view" do
      get :index                
      expect(response.body).to include("Name")
      expect(response.body).to include("Email")
      expect(response.body).to include("Password")
      expect(response.body).to include("Password confirmation")    
      #expect(response).to render_template(:index)
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
      puts subject.request.flash[:notice]

      post :create, user: {name: 'Herik Lima', email: 'heriklyma@hotmail.com', password: '1234', password_confirmation: '1234'}
      expect( subject.request.flash[:notice] ).to include("E-mail já cadastrado.")
      puts subject.request.flash[:notice]
    end  
  end
end
