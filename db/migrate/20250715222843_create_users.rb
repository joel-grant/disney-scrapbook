class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, limit: 100
      t.string :last_name, null: false, limit: 100
      t.string :email, null: false, limit: 255
      t.string :password_digest, null: false

      t.timestamps
    end

    # Add constraints and indexes
    add_index :users, :email, unique: true
    add_check_constraint :users, "length(first_name) > 0", name: "first_name_not_empty"
    add_check_constraint :users, "length(last_name) > 0", name: "last_name_not_empty"
    add_check_constraint :users, "length(email) > 0", name: "email_not_empty"
  end
end
