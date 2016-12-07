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
    User.create(name: "lando", email: "lando2@lando2.com", password: "123abc").save
    user = User.find_by(email: "lando2@lando2.com")
    Account.create(name: "primeira", user_id: user.id, balance: 0.00).save
    Category.create(description: "primeira", user_id: user.id).save
    account = Account.find_by(name: "primeira")
    category = Category.find_by(description: "primeira")                      
    transac = Transaction.create(user_id: user.id, account_id: account.id, :amount => 1.54, category_id: category.id)
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

  it "has one category" do
    assoc = described_class.reflect_on_association(:category)
    expect(assoc.macro).to eq :has_one
  end
end
