class CreateAttraction < ActiveRecord::Migration[8.0]
  def change
    create_table :attractions do |t|
      t.string :name
      t.references :park, null: false, foreign_key: true

      t.timestamps
    end
  end
end
