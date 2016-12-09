# coding: utf-8
require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  before(:each) do
    @request.session[:user_id] = 1
  end
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
      expect(subject.body).to include ("category")
    end
  end

  describe "POST #create" do
    it "should return Account, Amount and Category can't be blank" do
      post :create, transaction: {account_id: "", amount: "", user_id: session[:user_id], category_id: ""}
      expect(subject.request.flash[:error]).to include("Account can't be blank", "Amount can't be blank", "Category can't be blank")
    end
    it "should return Account can't be blank" do
      post :create, transaction: {account_id: "", amount: "-1,23", user_id: session[:user_id], category_id: "1"}
      expect(subject.request.flash[:error]).to include("Account can't be blank")
    end
    it "should return Amount can't be blank" do
      post :create, transaction: {account_id: "1", amount: "", user_id: session[:user_id]}
      expect(subject.request.flash[:error]).to include("Amount can't be blank")
    end
    it "should return Transação Registrada" do
      @user = User.new
      @user.name = "Lando Lander"
      @user.email = "lando@hi.lander"
      @user.password = "lando0lander"
      @user.save
      
      @account = Account.new
      @account.name = "Lando"
      @account.balance = 0.0
      @account.user_id = session[:user_id]
      @account.save
      
      @category = Category.new
      @category.description = "Landos Trip"
      @category.user_id = session[:user_id]
      @category.save

      @request.session[:user_id] = User.find_by(email: "lando@hi.lander").id
      @acc = Account.find_by(name: "Lando")
      @cat = Category.find_by(description: "Landos Trip")
      
      post :create, transaction: {account_id: @acc.id, amount: "3.0", user_id: session[:user_id], category_id: @cat.id}
      expect(subject.request.flash[:success]).to include("Transação registrada")
    end
  end
end
