class CreateParks < ActiveRecord::Migration[8.0]
  def change
    create_table :parks do |t|
      t.string :name, null: false, limit: 255

      t.timestamps
    end

    # Add indexes for performance and uniqueness
    add_index :parks, :name, unique: true

    # Add check constraints for additional data integrity
    add_check_constraint :parks, "length(name) > 0", name: "name_not_empty"
  end
end
