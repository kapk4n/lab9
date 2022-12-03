class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.string :registration_number
      t.integer :engine_power
      t.integer :fuel_type

      t.timestamps
    end
  end
end
