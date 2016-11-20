require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it "invalid without data" do
    transac = Transaction.create()
    expect(transac).to_not be_valid
  end
  it "invalid without account and user" do
    transac = Transaction.create(:amount => 1.54)
    expect(transac).to_not be_valid
  end
  it "invalid without account" do
    transac = Transaction.create(user_id: 1, :amount => 1.54)
    expect(transac).to_not be_valid
  end
  it "invalid without user" do
    transac = Transaction.create(account_id: 1, :amount => 1.54)
    expect(transac).to_not be_valid
  end
  it "valid with all data" do
    transac = Transaction.create(user_id: 1, account_id: 1, :amount => 1.54)
    expect(transac).to be_valid
  end

  it "has one user" do
    assoc = described_class.reflect_on_association(:user)
    expect(assoc.macro).to eq :has_one
  end

  it "has one account" do
    assoc = described_class.reflect_on_association(:account)
    expect(assoc.macro).to eq :has_one
  end
end
