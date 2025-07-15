class RemoveLocationFromParks < ActiveRecord::Migration[8.0]
  def change
    remove_column :parks, :location, :string
  end
end
