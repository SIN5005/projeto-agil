class CreateRecoverPasswords < ActiveRecord::Migration[5.0]
  def change
    create_table :recover_passwords do |t|
      t.references :user, foreign_key: true
      t.string :token
      t.boolean :active

      t.timestamps
    end
  end
end
