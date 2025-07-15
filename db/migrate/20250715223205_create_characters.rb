class CreateCharacters < ActiveRecord::Migration[8.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false, limit: 255
      t.text :description
      t.references :park, null: false, foreign_key: true

      t.timestamps
    end

    # Add constraints and indexes
    add_index :characters, [ :name, :park_id ], unique: true, name: 'index_characters_on_name_and_park_id'
    add_check_constraint :characters, "length(name) > 0", name: "character_name_not_empty"
  end
end
