class TransactionsController < ApplicationController
  def new
    @accounts = Account.all
  end
end
