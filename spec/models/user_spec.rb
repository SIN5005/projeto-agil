require 'rails_helper'

RSpec.describe User, type: :model do
     before(:each) do
          @user          = User.new
          @user.name     = "Herik"
          @user.email    = "Herik@hotmail.com"
          @user.password = "1234"          
     end

     context "Salvar usuário" do
          it "Salvo com sucesso" do               
               result = @user.save

               expect(result[0]).to be_truthy
               expect(result[1]).to include("Salvo com sucesso.")
          end
          it "Erro ao salvar." do
               @user.name = nil
               result = @user.save

               expect(result[0]).to be_falsey
               expect(result[1]).to include("Erro ao salvar.")
          end
     end
     
     context "E-mail" do
          it "E-mail existe" do
               result = @user.save

               expect(@user.email_already_registered).to be_truthy
          end
          it "E-mail não existe" do               
               @user.email    = "Herik@hotmail.com.br"
               expect(@user.email_already_registered).to be_falsey
          end
     end

     context "Login" do
          it "Login com sucesso" do
               result = @user.save

               expect(@user.login[0]).to be_truthy               
          end
          it "Login falha" do                        
               @user.email    = "Herik@lima.com"
               @user.password = "123456"
               expect(@user.login[0]).to be_falsey
               expect(@user.login[1]).to eq(-1)
          end
     end
end
