class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.references :account, foreign_key: true
      t.references :category, foreign_key: true
      t.float :amount, null: false
    end
  end
end
