class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :name, null: false, limit: 255
      t.text :description
      t.references :park, null: false, foreign_key: true

      t.timestamps
    end

    # Add constraints and indexes
    add_index :events, [ :name, :park_id ], unique: true, name: 'index_events_on_name_and_park_id'
    add_check_constraint :events, "length(name) > 0", name: "event_name_not_empty"
  end
end
