class ChangeParksUniqueConstraint < ActiveRecord::Migration[8.0]
  def change
    # Remove the old unique constraint on name alone
    remove_index :parks, :name

    # Add new unique constraint on name scoped to resort
    add_index :parks, [ :name, :resort_id ], unique: true, name: 'index_parks_on_name_and_resort_id'
  end
end
