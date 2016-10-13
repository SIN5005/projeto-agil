require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  before(:each) do
    assign(:transactions, [
      Transaction.create!(
        :user => nil,
        :category => nil,
        :account => nil,
        :transaction_type => "Transaction Type",
        :value => 2.5
      ),
      Transaction.create!(
        :user => nil,
        :category => nil,
        :account => nil,
        :transaction_type => "Transaction Type",
        :value => 2.5
      )
    ])
  end

  it "renders a list of transactions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Transaction Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
  end
end
