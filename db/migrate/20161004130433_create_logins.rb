class CreateLogins < ActiveRecord::Migration[5.0]
  def change
    create_table :logins do |t|
      t.boolean :success
      t.references :users
 
      t.timestamps
    end
  end
end
