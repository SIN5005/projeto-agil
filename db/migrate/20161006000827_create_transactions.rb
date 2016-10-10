class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.float :value
      t.date :transaction_date
      t.string :transaction_type, limit: 1

      t.timestamps
    end
  end
end