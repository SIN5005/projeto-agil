json.extract! transaction, :id, :user_id, :category_id, :account_id, :transaction_type, :value, :transaction_date, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)