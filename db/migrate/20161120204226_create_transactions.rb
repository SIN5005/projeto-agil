class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :account, index: true
      t.belongs_to :user, index: true
      t.float :amount, :null => false
      t.timestamps
    end
  end
end
