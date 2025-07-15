class CreateRestaurants < ActiveRecord::Migration[8.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false, limit: 255
      t.text :description
      t.references :locatable, polymorphic: true, null: false

      t.timestamps
    end

    # Add constraints and indexes
    add_index :restaurants, [ :locatable_type, :locatable_id ]
    add_index :restaurants, [ :name, :locatable_type, :locatable_id ], unique: true, name: 'index_restaurants_on_name_and_locatable'
    add_check_constraint :restaurants, "length(name) > 0", name: "restaurant_name_not_empty"
  end
end
