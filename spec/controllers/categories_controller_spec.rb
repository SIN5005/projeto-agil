require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

	describe "GET #new" do
		subject {get :index}
		
		it "Chama a página de Categorias" do
			@request.session[:user_id] = 1
			#expect(subject).to render_template(:index)
		end
		it "Tem um usuário e um campo de descrição" do
			@request.session[:user_id] = 1
			expect(subject.body).to include ("Categorias cadastradas")
		end	
	end

	describe "POST #create" do
		it "shoud return Salvo com sucesso." do
			request.session[:user_id] = 1
			
			post :create, category: {description: 'Alimentação'}
			
			expect(request.flash[:notice]).to include("Sucesso.")
		end
		
		it "shoud return O campo Descrição deve ser preenchido." do
			#request.session[:user_id] = 1
			
			#post :create, category: {description: ''}
			
			#expect(request.flash[:notice]).to include("O campo Descrição deve ser preenchido.")
		end	
	end
	
end	