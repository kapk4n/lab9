class AdduniqindToCars < ActiveRecord::Migration[7.0]
  def change
    add_index :cars, :registration_number, unique: true
  end
end
