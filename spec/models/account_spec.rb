require 'rails_helper'

RSpec.describe Account, type: :model do
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
