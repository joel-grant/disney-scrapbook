class CreateModesOfTransportation < ActiveRecord::Migration[8.0]
  def change
    create_table :modes_of_transportations do |t|
      t.string :name, null: false, limit: 255
      t.references :resort, null: false, foreign_key: true

      t.timestamps
    end

    # Add constraints and indexes
    add_index :modes_of_transportations, [ :name, :resort_id ], unique: true, name: 'index_modes_of_transportation_on_name_and_resort_id'
    add_check_constraint :modes_of_transportations, "length(name) > 0", name: "transportation_name_not_empty"
  end
end
