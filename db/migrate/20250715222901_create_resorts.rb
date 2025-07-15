class CreateResorts < ActiveRecord::Migration[8.0]
  def change
    create_table :resorts do |t|
      t.string :name, null: false, limit: 255

      t.timestamps
    end

    # Add constraints and indexes
    add_index :resorts, :name, unique: true
    add_check_constraint :resorts, "length(name) > 0", name: "resort_name_not_empty"
  end
end
