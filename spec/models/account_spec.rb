require 'rails_helper'

RSpec.describe Account, type: :model do
    before(:each) do
        @account          = Account.new
        @account.name     = "Master"
        @account.balance  = 10.0
        @account.user_id  = 1
    end
     
    context "Salvar conta" do
         it "Salvo com sucesso!" do
             result = @account.save
             
             expect(result[0]).to be_truthy
             expect(result[1]).to include("Salvo com sucesso!")
         end
         it "Erro ao salvar" do
               @account.name = nil
               result = @account.save

               expect(result[0]).to be_falsey
               expect(result[1]).to include("Erro ao salvar")
          end
    end
     
    context "Validade de uma Conta" do
        it "Conta válida?" do
            account = Account.new
            account.name = "Visa"
            expect(account.valid?).to be_truthy
         end
    end
    
    context "Titulos válidos" do
        it "Titulo completo" do
            account = Account.new
            account.name = "Mastercard"
            
            expect(account.titulo_completo).to eql("Titulo completo com o nome do cartao")
        end
    end
    #https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    #https://github.com/rspec/rspec-expectations
end
