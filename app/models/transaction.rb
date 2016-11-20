class Transaction < ApplicationRecord
  validates_presence_of :user_id, :account_id, :amount
end
