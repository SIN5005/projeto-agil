require 'rails_helper'

RSpec.describe "transactions/show", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :user => nil,
      :category => nil,
      :account => nil,
      :transaction_type => "Transaction Type",
      :value => 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Transaction Type/)
    expect(rendered).to match(/2.5/)
  end
end
