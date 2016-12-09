require 'rails_helper'

RSpec.describe Category, type: :model do

    before(:each) do
    	@category             = Category.new
        @category.description = "teste"
        @category.user_id     = "1"
    end

    it "Dados inválidos para criar categoria" do
        result = Category.create()
        expect(result).to_not be_valid
    end
    
    it "Inválido sem usuário" do
        result = Category.create(:description => "teste")
        expect(result).to_not be_valid
    end
    
    it "Inválido sem descrição" do
		category = Category.new
		category.description = nil
		expect(category.valid?).to be_falsey
	end
    
    it "Tem um usuário" do
        result = described_class.reflect_on_association(:user)
        expect(result.macro).to eq :belongs_to
    end   
    
#    it "Válido com todos os dados" do        
#        expect(@category.save[0]).to be_truthy
#    end
    
end