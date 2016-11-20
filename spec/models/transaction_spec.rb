require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context "without DB" do
    it "invalid without data" do
      transac = Transaction.new()
      expect(transac).to_not be_valid
    end
    it "invalid without account and user" do
      transac = Transaction.new(:amount => 1.54)
      expect(transac).to_not be_valid
    end
    it "invalid without account" do
      transac = Transaction.new(user_id: 1, :amount => 1.54)
      expect(transac).to_not be_valid
    end
    it "invalid without user" do
      transac = Transaction.new(account_id: 1, :amount => 1.54)
      expect(transac).to_not be_valid
    end
    it "valid with all data" do
      transac = Transaction.new(user_id: 1, account_id: 1, :amount => 1.54)
      expect(transac).to be_truthy
    end
  end
end
