require 'rails_helper'

RSpec.describe "accounts/index", type: :view do
  before(:each) do
    assign(:accounts, [
      Account.create!(
        :name => "Name",
        :balance => 2.5
      ),
      Account.create!(
        :name => "Name",
        :balance => 2.5
      )
    ])
  end

  it "renders a list of accounts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
  end
end
