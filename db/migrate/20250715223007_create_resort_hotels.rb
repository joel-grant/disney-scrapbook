class CreateResortHotels < ActiveRecord::Migration[8.0]
  def change
    create_table :resort_hotels do |t|
      t.string :name, null: false, limit: 255
      t.text :description
      t.references :resort, null: false, foreign_key: true

      t.timestamps
    end

    # Add constraints and indexes
    add_index :resort_hotels, [ :name, :resort_id ], unique: true, name: 'index_resort_hotels_on_name_and_resort_id'
    add_check_constraint :resort_hotels, "length(name) > 0", name: "resort_hotel_name_not_empty"
  end
end
