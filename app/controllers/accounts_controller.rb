class AccountsController < ApplicationController
    
    def index
        @contas = Account.order :nome
    end
    
    def create
        valores = params.require(:account).permit!
        account = Account.create valores
    end
end
