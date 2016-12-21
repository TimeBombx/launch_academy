class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.integer :manufacturer_id, null: false
      t.string :model, null: false
      t.string :color, null: false
      t.string :year, null: false
      t.integer :mileage, null: false
      t.text :description, null: false, default: ""

      t.timestamps
    end
  end
end
