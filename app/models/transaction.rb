class Transaction < ApplicationRecord
  has_one :user, class_name: "User"
  has_one :account, class_name: "Account"
  has_one :category, class_name: "Category"
  
  validates_presence_of :user_id, :account_id, :amount, :category_id
end
