require 'rails_helper'

RSpec.describe "transactions/new", type: :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      :user => nil,
      :category => nil,
      :account => nil,
      :transaction_type => "MyString",
      :value => 1.5
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "input#transaction_user_id[name=?]", "transaction[user_id]"

      assert_select "input#transaction_category_id[name=?]", "transaction[category_id]"

      assert_select "input#transaction_account_id[name=?]", "transaction[account_id]"

      assert_select "input#transaction_transaction_type[name=?]", "transaction[transaction_type]"

      assert_select "input#transaction_value[name=?]", "transaction[value]"
    end
  end
end
