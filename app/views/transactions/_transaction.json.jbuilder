json.extract! transaction, :id, :user_id, :category_id, :value, :transaction_date, :transaction_type, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)