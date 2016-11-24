class TransactionsController < ApplicationController
  def new
    @acc_list = Account.all.order(:name).collect{|p| [p.name, p.id]}
  end
end
