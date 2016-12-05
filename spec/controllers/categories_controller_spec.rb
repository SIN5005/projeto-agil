require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

	describe "GET #new" do
		subject {get :index}
		
		it "Chama a página de Categorias" do
			@request.session[:user_id] = 1
			expect(subject).to render_template(:index)
		end
		it "Tem um usuário e um campo de descrição" do
			@request.session[:user_id] = 1
			expect(subject.body).to include ("description")
		end	
	end

	#describe "POST #create" do
	#	subject {post :create}
		
	#	it "shoud return Salvo com sucesso." do
	#		category = Category.new
	#		category.description = "teste"
	#		@request.session[:user_id] = 1
	#		category.save
	#		expect( subject.request.flash[:notice] ).to include("Salvo com sucesso.")
	#	end
		
	#	it "shoud return Preencha o campo descrição." do
	#		category = Category.new
	#		category.description = nil
	#		@request.session[:user_id] = 1
	#		expect( subject.request.flash[:notice] ).to include("Preencha o campo descrição.")
	#	end
	#end	
	
end