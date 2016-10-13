require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validade de um Usuário" do
  	it "Usuário válido" do
  		user = User.new
  		user.name = "Herik"
  		user.email = "Herik@hotmail.com"

  		expect(user.valid?).to be_truthy
  	end
  	it "Usuário inválido" do
  		user = User.new  		
  		expect(user.valid?).to be_falsy
  	end
  	it "Tenta criar dois Usuários com o mesmo e-mail" do
  		user1 = User.new(name: "Herik", email: "heriklyma@hotmail.com", password: "1234")
  		expect(user1.save).to be_truthy

  		user2 = User.new(name: "Herik", email: "heriklyma@hotmail.com", password: "1234")
  		expect(user2.save).to be_falsy
  	end
  end
  
  context "CRUD de um Usuário" do
  	it "Criar e deletar um Usuário" do
  		user = User.new(name: "Herik", email: "heriklyma@hotmail.com", password: "1234")
  		expect(user.save).to be_truthy

  		expect(user.destroy).to be_truthy
  	end
  	it "Criar e alterar um Usuário" do
  		user = User.new(name: "Herik", email: "heriklyma@hotmail.com", password: "1234")
  		expect(user.save).to be_truthy

  		user.password = "123456"
		expect(user.valid?).to be_truthy
  	end
  	it "Criar e consultar um Usuário" do
  		user1 = User.new(name: "Herik", email: "heriklyma@hotmail.com", password: "1234")
  		expect(user1.save).to be_truthy


		user2 = User.new(name: "Herik2", email: "heriklyma2@hotmail.com", password: "1234")
  		expect(user2.save).to be_truthy
  		
		user = User.all
		expect(user.count).to eq(2) 
  	end
  end  	
end
