require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe "GET #new" do
    it "renders the :new view" do
      get :new
      expect(response.body).to include ("Amount")
      expect(response.body).to include ("Account_id")
    end
  end
end
