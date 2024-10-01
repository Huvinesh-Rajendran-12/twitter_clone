class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.string :email_address, null: false
      t.string :password_digest, null: false

      t.boolean :verified, null: false, default: false

      t.timestamps
    end
    add_index :users, :email_address, unique: true
  end
end
