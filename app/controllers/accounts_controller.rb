class AccountsController < ApplicationController
    
    def index
        @contas = Account.order :id
    end
    
    def create
        valores = params.require(:account).permit!
        Account.create valores
        redirect_to accounts_url
    end
    
    def destroy
        Account.destroy params[:id]
        redirect_to accounts_url
    end
end
