require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe "GET #new" do
    subject {get :new}
    
    it "renders the :new view" do
      expect(subject).to render_template(:new)
    end
    it "has an account and an amount field" do
      expect(subject.body).to include ("value")
      expect(subject.body).to include ("account")
    end
  end
end
