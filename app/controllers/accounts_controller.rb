# coding: utf-8
class AccountsController < ApplicationController
    
    def index
        @contas = Account.where({user_id: session[:user_id]}).order :id
    end
    
    def create
        accountParams = params[:account]
        @account = Account.new
        @account.name = accountParams[:name]
        @account.balance = accountParams[:balance]
        @account.user_id = accountParams[:user_id]
        
        if accountParams[:name].empty?
            flash[:notice] = "O campo 'Nome' deve ser preenchido"
            redirect_to accounts_new_url
        elsif @account.name_already_registered
            flash[:notice] = "Nome da conta já utilizado"
            redirect_to accounts_new_url
        elsif accountParams[:balance].empty?
            flash[:notice] = "O campo 'Saldo' deve ser preenchido"
            redirect_to accounts_new_url
        elsif 
            flash[:notice] = @account.create
            redirect_to accounts_url
        end
    end
    
    def destroy
        @transactions = Transaction.find_by(account_id: params[:id])
        if @transactions
            @transactions.destroy
        end
            Account.destroy params[:id]
            redirect_to accounts_url
    end
end
