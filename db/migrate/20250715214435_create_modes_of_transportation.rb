class CreateModesOfTransportation < ActiveRecord::Migration[8.0]
  def change
    create_table :modes_of_transportations do |t|
      t.string :name
      t.references :resort, null: false, foreign_key: true

      t.timestamps
    end
  end
end
