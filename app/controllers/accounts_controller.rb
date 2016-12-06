class AccountsController < ApplicationController
    
    def index
        @contas = Account.order :id
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
            flash[:notice] = @account.save[1]
            redirect_to accounts_url
        end
        
        #valores = params.require(:account).permit!
        #Account.create valores
        #redirect_to accounts_url
    end
    
    def destroy
        Account.destroy params[:id]
        redirect_to accounts_url
    end
end
