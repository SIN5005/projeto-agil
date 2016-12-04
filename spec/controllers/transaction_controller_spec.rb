# coding: utf-8
require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe "GET #new" do
    subject {get :new}
    
    it "renders the :new view" do
      @request.session[:user_id] = 1
      expect(subject).to render_template(:new)
    end
    it "has an account and an amount field" do
      @request.session[:user_id] = 1
      expect(subject.body).to include ("value")
      expect(subject.body).to include ("account")
    end
  end

  describe "POST #create" do
    it "should return Account and Amount can't be blank" do
      post :create, transaction: {account_id: "", amount: "", user_id: "2"}
      expect(subject.request.flash[:error]).to include("Account can't be blank", "Amount can't be blank")
    end
    it "should return Account can't be blank" do
      post :create, transaction: {account_id: "", amount: "-1,23", user_id: "2"}
      expect(subject.request.flash[:error]).to include("Account can't be blank")
    end
    it "should return Amount can't be blank" do
      post :create, transaction: {account_id: "1", amount: "", user_id: "2"}
      expect(subject.request.flash[:error]).to include("Amount can't be blank")
    end
    it "should return Transação Registrada" do
      post :create, transaction: {account_id: "1", amount: "3", user_id: "2"}
      expect(subject.request.flash[:success]).to include("Transação registrada")
    end
  end
end
