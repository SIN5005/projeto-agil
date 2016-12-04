# coding: utf-8
class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new
    @user_id = session[:user_id]
  end
  
  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      flash[:success] = "Transação registrada"
      flash.keep(:success)
    else
      flash[:error] = @transaction.errors.full_messages
      flash.keep(:error)
    end
    redirect_to action: "new"
  end

  def transaction_params
    params.require(:transaction).permit(:account_id, :user_id, :amount)
  end
end
