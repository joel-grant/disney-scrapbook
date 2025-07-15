class CreateParks < ActiveRecord::Migration[8.0]
  def change
    create_table :parks do |t|
      t.string :name, null: false, limit: 255
      t.references :resort, null: false, foreign_key: true

      t.timestamps
    end

    # Add constraints and indexes
    add_index :parks, [ :name, :resort_id ], unique: true, name: 'index_parks_on_name_and_resort_id'
    add_check_constraint :parks, "length(name) > 0", name: "park_name_not_empty"
  end
end
