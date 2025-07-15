class CreateShows < ActiveRecord::Migration[8.0]
  def change
    create_table :shows do |t|
      t.string :name, null: false, limit: 255
      t.text :description
      t.references :park, null: false, foreign_key: true

      t.timestamps
    end

    # Add constraints and indexes
    add_index :shows, [ :name, :park_id ], unique: true, name: 'index_shows_on_name_and_park_id'
    add_check_constraint :shows, "length(name) > 0", name: "show_name_not_empty"
  end
end
