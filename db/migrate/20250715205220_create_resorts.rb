class CreateResorts < ActiveRecord::Migration[8.0]
  def change
    create_table :resorts do |t|
      t.string :name, null: false, limit: 100

      t.timestamps
    end

    # Add database-level constraints for data integrity
    add_index :resorts, :name, unique: true

    # Add check constraint to ensure name is not empty
    add_check_constraint :resorts, "length(name) > 0", name: "name_not_empty"
  end
end
