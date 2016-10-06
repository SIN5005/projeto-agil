require 'rails_helper'

RSpec.describe "transactions/edit", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :user => nil,
      :category => nil,
      :value => 1.5,
      :transaction_type => "MyString"
    ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "input#transaction_user_id[name=?]", "transaction[user_id]"

      assert_select "input#transaction_category_id[name=?]", "transaction[category_id]"

      assert_select "input#transaction_value[name=?]", "transaction[value]"

      assert_select "input#transaction_transaction_type[name=?]", "transaction[transaction_type]"
    end
  end
end
